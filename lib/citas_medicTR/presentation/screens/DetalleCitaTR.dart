import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/citas_medicTR/presentation/providers/appointments_provider.dart';

class DetalleCitaTr extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cita = ref.watch(appointmentProvider).citaSeleccionada;

    if (cita == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Detalle de Cita")),
        body: Center(child: Text("No hay información de la cita")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Detalle de Cita')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("DETALLE DE LA CITA"),
            const SizedBox(height: 20),
            _buildDetailCard(cita),
            const SizedBox(height: 20),
            _buildEstadoDropdown(ref, cita),
            const SizedBox(height: 20),
            _buildGuardarButton(ref, cita),
          ],
        ),
      ),
    );
  }

  /// 🔹 Estilo para el título principal
  Widget _buildTitle(String title) {
    return Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 🔹 Tarjeta con detalles de la cita
  Widget _buildDetailCard(cita) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow("Paciente", cita.patient),
            _buildDetailRow("Fecha", cita.date),
            _buildDetailRow("Hora", cita.appointmentTime),
            _buildDetailRow("Área", cita.specialtyTherapy),
            _buildDetailRow("Médico", cita.doctor),
            _buildDetailRow("Diagnóstico", cita.diagnosis),
            _buildDetailRow("Correo", cita.emailPatient),
          ],
        ),
      ),
    );
  }

  /// 🔹 Elemento para mostrar cada detalle en la tarjeta
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // 🔹 Asegura que el texto largo se ajuste
        children: [
          Text(
            "$label:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Expanded(
            // 🔹 Permite que el texto largo se ajuste en múltiples líneas
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              softWrap: true, // 🔹 Permite el salto de línea automático
              overflow:
                  TextOverflow.visible, // 🔹 Asegura que el texto no se recorte
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Selector de estado con `DropdownButtonFormField`
  Widget _buildEstadoDropdown(WidgetRef ref, cita) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Estado de la cita:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButtonFormField<String>(
            value: cita.status,
            items: ["Pendiente", "Agendado"].map((estado) {
              return DropdownMenuItem(value: estado, child: Text(estado));
            }).toList(),
            onChanged: (nuevoEstado) {
              if (nuevoEstado != null) {
                ref
                    .read(appointmentProvider.notifier)
                    .actualizarEstadoCita(cita.id, nuevoEstado);
              }
            },
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }

  /// 🔹 Botón de guardar con icono
  Widget _buildGuardarButton(WidgetRef ref, cita) {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          print("Guardando cambios...");
          ref.read(appointmentProvider.notifier).actualizarCita(cita);
          // Aquí puedes agregar la lógica de guardado si es necesario
        },
        icon: Icon(Icons.save),
        label: Text("Guardar Cambios"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
