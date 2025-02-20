import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/cita.entity.dart';
import 'package:h_c_1/citas_medicTR/presentation/providers/appointments_provider.dart';
import 'package:h_c_1/citas_medicTR/presentation/screens/GenerarCitasTR.dart';
import 'package:h_c_1/citas_medicTR/presentation/widgets/NavigationButtonCT_TR.dart';
import 'package:h_c_1/citas_medicTR/presentation/widgets/headerCT_TR.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class HorarioCitasTr extends ConsumerWidget {
  final DateTime _focusedDay = DateTime.now();
  final DateTime? _selectedDay = null;

  final List<Map<String, dynamic>> citas = List.generate(10, (index) {
    return {
      'area': 'Área ${index + 1}',
      'fecha': DateTime(2025, 1, (index % 9) + 1),
      'hora': '${9 + index % 12}:00 AM',
      'estado': index % 2 == 0 ? 'pendiente' : 'aceptado',
    };
  });

  bool _isCitaAsignada(DateTime day) {
    return citas.any((cita) =>
        isSameDay(cita['fecha'], day) && cita['estado'] == 'pendiente');
  }

  void _editarCita(BuildContext context, Appointments cita) {
    TextEditingController areaController =
        TextEditingController(text: cita.specialtyTherapy);
    TextEditingController horaController =
        TextEditingController(text: cita.appointmentTime);
    DateTime? selectedDate = DateFormat('MMMM d, y', 'en_US').parse(cita.date);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Cita'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: areaController,
                decoration: InputDecoration(labelText: 'Área'),
              ),
              TextField(
                controller: horaController,
                decoration: InputDecoration(labelText: 'Hora'),
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate ?? DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;
                  }
                },
                child: Text('Seleccionar Fecha'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // cita['area'] = areaController.text;
                // cita['hora'] = horaController.text;
                // cita['fecha'] = selectedDate ?? cita['fecha'];
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentState = ref.watch(appointmentProvider);
    final notifier = ref.read(appointmentProvider.notifier);

    final selectedDate = appointmentState.calendarioCitaSeleccionada;
    return Scaffold(
      appBar: AppBar(
        title: Text('Horario de Citas'),
      ),
      body: Column(
        children: [
          HeaderctTrWidget(
            textoDinamico: '  HORARIO DE CITAS MÉDICAS',
            textoCitasMedicas: '                    HORARIO',
          ),
          const SizedBox(height: 20),
          SizedBox(height: 15),
          NavigationTrButton(
            navigationRoute: (context) => GenerarCitasTr(),
            buttonText: 'AGENDAR UNA CITA',
          ),
          SizedBox(height: 20),
          Divider(),
          TableCalendar(
            availableGestures: AvailableGestures.all,
            locale: "es_EC",
            firstDay: DateTime.utc(2025, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: selectedDate,
            selectedDayPredicate: (day) => isSameDay(day, selectedDate),
            onDaySelected: (selectedDay, focusedDay) {
              notifier.onDateSelected(selectedDay);
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final citasDelDia = appointmentState.citas.where((cita) {
                  try {
                    final citaDate =
                        DateFormat('MMMM d, y', 'en_US').parse(cita.date);
                    return isSameDay(day, citaDate);
                  } catch (_) {
                    return false;
                  }
                }).toList();
                Color? backgroundColor;
                if (citasDelDia.any((cita) => cita.status == 'Agendado')) {
                  backgroundColor = Colors.green; // Agendado
                } else if (citasDelDia
                    .any((cita) => cita.status == 'Pendiente')) {
                  backgroundColor = Colors.orange; // Pendiente
                }
                return Container(
                  margin: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: backgroundColor ?? Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: backgroundColor != null
                          ? Colors.white
                          : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: appointmentState.citas.map((cita) {
                return ListTile(
                  leading: Icon(Icons.event_available, color: Colors.green),
                  title: Text('${cita.specialtyTherapy}'),
                  subtitle: Text('${cita.date} a las ${cita.appointmentTime}'),
                  onTap: () => _editarCita(context, cita),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
