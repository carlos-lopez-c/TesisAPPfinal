import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/hc_tr/presentation/providers/hc_form_general_provider.dart';

class EspecificacionesWidget extends ConsumerWidget {
  const EspecificacionesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hcState = ref.watch(hcGeneralProvider);
    final hcNotifier = ref.read(hcGeneralProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('ESPECIFICACIONES'),
        _buildMultilineFormField(
          label: 'Intensión comunicativa',
          initialValue: hcState
              .createHcGeneral
              .antecedentesPerinatales
              .antecedentesPostnatales
              .especificaciones
              .intensionComunicativaHospitalizaciones,
          onChanged: hcNotifier.onIntensionComunicativaHospitalizacionesChanged,
        ),
        _buildMultilineFormField(
          label: 'Traumatismo',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.traumatismo,
          onChanged: hcNotifier.onEspecificacionesTraumatismoChanged,
        ),
        _buildMultilineFormField(
          label: 'Infecciones, alergias, otitis, farin......',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.infecciones,
          onChanged: hcNotifier.onEspecificacionesInfeccionesChanged,
        ),
        _buildMultilineFormField(
            label: 'Reacciones peculiares vacunas',
            initialValue: hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .especificaciones
                .reaccionesPeculiaresVacunas,
            onChanged: hcNotifier
                .onEspecificacionesReaccionesPeculiaresVacunasChanged),
        _buildMultilineFormField(
          label: 'Desnutrición/Obesidad',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.desnutricionOObesidad,
          onChanged: hcNotifier.onEspecificacionesDesnutricionOObesidadChanged,
        ),
        _buildMultilineFormField(
          label: 'Cirugías',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.cirugias,
          onChanged: hcNotifier.onEspecificacionesCirugiasChanged,
        ),
        _buildMultilineFormField(
          label: 'Convulsiones fabriles o epilepsia.....',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.convulsiones,
          onChanged: hcNotifier.onEspecificacionesConvulcionesChanged,
        ),
        _buildMultilineFormField(
          label: 'Medicación',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.medicacion,
          onChanged: hcNotifier.onEspecificacionesMedicacionChanged,
        ),
        _buildMultilineFormField(
          label: 'Síndromes',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.sindromes,
          onChanged: hcNotifier.onEspecificacionesSindromesChanged,
        ),
        _buildMultilineFormField(
          label: 'Observaciones',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.observaciones,
          onChanged: hcNotifier.onEspecificacionesObservacionesChanged,
        ),
        _buildMultilineFormField(
          label: 'EEG, TAC, RM......',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.especificaciones.diagnosticStudies,
          onChanged: hcNotifier.onEspecificacionesDiagnosticStudiesChanged,
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
