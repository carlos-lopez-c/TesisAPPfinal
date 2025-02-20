import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/citas_medicTR/presentation/providers/appointments_form_provider.dart';
import 'package:h_c_1/citas_medicTR/presentation/widgets/headerCT_TR.dart';

class GenerarCitasTr extends ConsumerStatefulWidget {
  @override
  _GenerarCitasTrState createState() => _GenerarCitasTrState();
}

class _GenerarCitasTrState extends ConsumerState<GenerarCitasTr> {
  final TextEditingController _nombreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appointmentFormState = ref.watch(appointmentFormProvider);
    final notifier = ref.read(appointmentFormProvider.notifier);

    // 🔹 Actualiza el controlador cuando el paciente cambia
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (appointmentFormState.patientEntity != null) {
        _nombreController.text =
            '${appointmentFormState.patientEntity!.firstname} ${appointmentFormState.patientEntity!.lastname}';
      } else {
        _nombreController.text = '';
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar una cita'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderctTrWidget(
              textoDinamico: '  AGENDACIÓN DE CITAS MÉDICAS',
              textoCitasMedicas: '',
            ),
            SizedBox(height: 20),

            // 🔹 Buscar Paciente por DNI
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: notifier.onCedulaChanged,
                    decoration: InputDecoration(labelText: 'Buscar por cédula'),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    notifier.getPacienteByDni(appointmentFormState.cedula);
                  },
                  child: Text('Buscar'),
                ),
              ],
            ),

            SizedBox(height: 20),

            // 🔹 Nombre del Paciente (usando un controlador)
            TextFormField(
              controller: _nombreController,
              enabled: false, // Para que no sea editable
              decoration: InputDecoration(
                labelText: 'Nombre del Paciente',
                hintText: 'Nombre del paciente',
              ),
            ),

            SizedBox(height: 10),

            // 🔹 Diagnóstico
            TextField(
              onChanged: notifier.onDiagnosisChanged,
              decoration: InputDecoration(labelText: 'Diagnóstico'),
            ),

            SizedBox(height: 10),

            // 🔹 Selección de Área Terapéutica
            DropdownButtonFormField<String>(
              value: appointmentFormState.specialtyTherapyId,
              hint: Text('Seleccione un Área'),
              items: appointmentFormState.areas.map((area) {
                return DropdownMenuItem(
                  value: area.id,
                  child: Text(area.name),
                );
              }).toList(),
              onChanged: (value) => notifier.onAreaChanged(value!),
            ),

            SizedBox(height: 20),

            // 🔹 Selección de Fecha y Hora
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                      if (selectedDate != null)
                        notifier.onDateChanged(selectedDate);
                    },
                    child: Text(appointmentFormState.selectedDate == null
                        ? 'Seleccionar Fecha'
                        : 'Fecha: ${appointmentFormState.selectedDate!.toLocal()}'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final selectedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (selectedTime != null) {
                        notifier.onTimeChanged(selectedTime.format(context));
                      }
                    },
                    child: Text(appointmentFormState.selectedTime == null
                        ? 'Seleccionar Hora'
                        : 'Hora: ${appointmentFormState.selectedTime}'),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                notifier.saveAppointment();
              },
              child: Text('Guardar Cita'),
            ),
          ],
        ),
      ),
    );
  }
}
