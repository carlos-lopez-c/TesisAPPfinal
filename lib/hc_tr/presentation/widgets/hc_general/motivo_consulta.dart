import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/hc_tr/presentation/providers/hc_form_general_provider.dart';

class MotivoConsultaWidget extends ConsumerWidget {
  const MotivoConsultaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hcState = ref.watch(hcGeneralProvider);
    final hcNotifier = ref.read(hcGeneralProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('2.- MOTIVO DE CONSULTA'),
        _buildMultilineFormField(
          label: 'Motivo de consulta',
          initialValue: hcState.createHcGeneral.motivoDeConsulta,
          onChanged: hcNotifier.onMotivoDeConsultaChanged,
        ),
        const Divider(),
        _buildSection('3.- CARACTERIZACIÓN DEL PROBLEMA'),
        _buildMultilineFormField(
          label: 'Descripción del problema',
          initialValue: hcState.createHcGeneral.caracterizacionDelProblema,
          onChanged: hcNotifier.onCaracterizacionDelProblemaChanged,
        ),
      ],
    );
  }

  // 🔹 Sección con título estilizado
  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  // 🔹 Campo de texto multilínea conectado al estado
  Widget _buildMultilineFormField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLines: 5, // Permite múltiples líneas para respuestas detalladas
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
