import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/hc_tr/presentation/providers/hc_form_general_provider.dart';

class HabitosPersonalesWidget extends ConsumerWidget {
  const HabitosPersonalesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hcState = ref.watch(hcGeneralProvider);
    final hcNotifier = ref.read(hcGeneralProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('5.- HÁBITOS PERSONALES'),

        // 🔹 Reacción ante las dificultades
        _buildInlineCheckboxGroup(
          title: "Reacción ante las dificultades",
          options: [
            "Berrinches",
            "Insulta",
            "Llora",
            "Grita",
            "Agrede",
            "Se encierra",
            "Pide ayuda",
            "Pega a los padres"
          ],
          selectedValues: [
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.berrinches,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.insulta,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.llora,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.grita,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.agrede,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.seEncierra,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.pideAyuda,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.habitosPersonales.pegaALosPadres,
          ],
          onChangedList: [
            hcNotifier.onHabitosPersonalesBerrinchesChanged,
            hcNotifier.onHabitosPersonalesInsultaChanged,
            hcNotifier.onHabitosPersonalesLloraChanged,
            hcNotifier.onHabitosPersonalesGritaChanged,
            hcNotifier.onHabitosPersonalesAgredeChanged,
            hcNotifier.onHabitosPersonalesSeEncierraChanged,
            hcNotifier.onHabitosPersonalesPideAyudaChanged,
            hcNotifier.onHabitosPersonalesPegaALosPadresChanged,
          ],
        ),
        const Divider(),

        // 🔹 Aptitudes e intereses escolares
        _buildSection('Aptitudes e intereses escolares'),
        _buildMultilineFormField(
            label: 'Describa...',
            initialValue: hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aptitudesEInteresesEscolares,
            onChanged: hcNotifier
                .onHabitosPersonalesAptitudesInteresesEscolaresChanged),
        const Divider(),

        // 🔹 Rendimiento general en escolaridad
        _buildSection('Rendimiento general en escolaridad'),
        _buildMultilineFormField(
          label: 'Describa...',
          initialValue: hcState
              .createHcGeneral
              .antecedentesPerinatales
              .antecedentesPostnatales
              .habitosPersonales
              .rendimientoGeneralEscolaridad,
          onChanged: hcNotifier
              .onHabitosPersonalesRendimientoGeneralEscolaridadChanged,
        ),
        const Divider(),

        // 🔹 Comportamiento general
        _buildInlineCheckboxGroup(
          title: "Comportamiento general",
          options: [
            "Agresivo",
            "Pasivo",
            "Destructor",
            "Social",
            "Hipercinético",
            "Empatía",
            "Intereses peculiares",
            "Interés por interacción"
          ],
          selectedValues: [
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .agresivo,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .pasivo,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .destructor,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .sociable,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .hipercinetico,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .empatia,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .interesesPeculiares,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .comportamientoGeneral
                .interesPorInteraccion,
          ],
          onChangedList: [
            hcNotifier.onHabitosPersonalesComportamientoGeneralAgresivoChanged,
            hcNotifier.onHabitosPersonalesComportamientoGeneralPasivoChanged,
            hcNotifier
                .onHabitosPersonalesComportamientoGeneralDestructorChanged,
            hcNotifier.onHabitosPersonalesComportamientoGeneralSociableChanged,
            hcNotifier
                .onHabitosPersonalesComportamientoGeneralHipercineticoChanged,
            hcNotifier.onHabitosPersonalesComportamientoGeneralEmpatiaChanged,
            hcNotifier
                .onHabitosPersonalesComportamientoGeneralInteresesPeculiaresChanged,
            hcNotifier
                .onHabitosPersonalesComportamientoGeneralInteresPorInteraccionChanged,
          ],
        ),
        const Divider(),
        _buildSection('ASPECTOS DE SOCIALIZACIÓN'),
        _buildInlineCheckboxGroup(
          title: "Socialización",
          options: [
            "Mayores",
            "Menores",
            "Socialización con familia",
            "Reacción con personas extrañas",
            "Todos"
          ],
          selectedValues: [
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .mayores,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .menores,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .socializacionConFamilia,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .reaccionConPersonasExtranas,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .todos,
          ],
          onChangedList: [
            hcNotifier.onHabitosPersonalesAspectosSocializacionMayoresChanged,
            hcNotifier.onHabitosPersonalesAspectosSocializacionMenoresChanged,
            hcNotifier
                .onHabitosPersonalesAspectosSocializacionSocializacionConFamiliaChanged,
            hcNotifier
                .onHabitosPersonalesAspectosSocializacionReaccionConPersonasExtranasChanged,
            hcNotifier.onHabitosPersonalesAspectosSocializacionTodosChanged,
          ],
        ),

        const Divider(),

        // 🔹 ASPECTOS COGNITIVOS
        _buildInlineCheckboxGroup(
          title: "Aspectos Cognitivos",
          options: [
            "Logra concentrarse 5 min",
            "Reconoce partes del cuerpo",
            "Asocia objetos",
            "Reconoce a sus familiares",
            "Reconoce colores básicos"
          ],
          selectedValues: [
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .lograConcentrarse5Min,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .reconocePartesDelCuerpo,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .asociaObjetos,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .reconoceASusFamiliares,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .aspectosSocializacion
                .reconoceColoresBasicos,
          ],
          onChangedList: [
            hcNotifier
                .onHabitosPersonalesAspectosSocializacionLograConcentrarse5MinChanged,
            hcNotifier
                .onHabitosPersonalesAspectosSocializacionReconocePartesDelCuerpoChanged,
            hcNotifier
                .onHabitosPersonalesAspectosSocializacionAsociaObjetosChanged,
            hcNotifier
                .onHabitosPersonalesAspectosSocializacionReconoceASusFamiliaresChanged,
            hcNotifier
                .onHabitosPersonalesAspectosSocializacionReconoceColoresBasicosChanged,
          ],
        ),

        const Divider(),

        // 🔹 DATOS FAMILIARES
        _buildSection('DATOS FAMILIARES'),
        _buildInlineCheckboxGroup(
          title: "Tipo de hogar",
          options: [
            "Nuclear",
            "Monoparental",
            "Funcional",
            "Reconstituida",
            "Disfuncional",
            "Extensa"
          ],
          selectedValues: [
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .datosFamiliares
                .nuclear,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .datosFamiliares
                .monoParental,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .datosFamiliares
                .funcional,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .datosFamiliares
                .reconstituida,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .datosFamiliares
                .disfuncional,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .datosFamiliares
                .extensa,
          ],
          onChangedList: [
            hcNotifier.onHabitosPersonalesDatosFamiliaresNuclearChanged,
            hcNotifier.onHabitosPersonalesDatosFamiliaresMonoParentalChanged,
            hcNotifier.onHabitosPersonalesDatosFamiliaresFuncionalChanged,
            hcNotifier.onHabitosPersonalesDatosFamiliaresReconstituidaChanged,
            hcNotifier.onHabitosPersonalesDatosFamiliaresDisfuncionalChanged,
            hcNotifier.onHabitosPersonalesDatosFamiliaresExtensaChanged,
          ],
        ),

        const Divider(),

        // 🔹 ¿Quién vive en la casa?
        _buildSection('¿Quién vive en la casa?'),
        _buildMultilineFormField(
          label: 'Describa quien vive en la casa',
          initialValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.habitosPersonales.quienViveEnCasa,
          onChanged: hcNotifier.onHabitosPersonalesQuienViveEnCasaChanged,
        ),

        const Divider(),

        // 🔹 INTEGRACIÓN SENSORIAL
        _buildInlineCheckboxGroup(
          title: "Integración Sensorial",
          options: ["Vista", "Oído", "Tacto", "Gusto y Olfato"],
          selectedValues: [
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .integracionSensorial
                .vista,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .integracionSensorial
                .oido,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .integracionSensorial
                .tacto,
            hcState
                .createHcGeneral
                .antecedentesPerinatales
                .antecedentesPostnatales
                .habitosPersonales
                .integracionSensorial
                .gustoYolfato,
          ],
          onChangedList: [
            hcNotifier.onHabitosPersonalesIntegracionSensorialVistaChanged,
            hcNotifier.onHabitosPersonalesIntegracionSensorialOidoChanged,
            hcNotifier.onHabitosPersonalesIntegracionSensorialTactoChanged,
            hcNotifier
                .onHabitosPersonalesIntegracionSensorialGustoYolfatoChanged,
          ],
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

  // 🔹 Grupo de checkboxes en línea
  Widget _buildInlineCheckboxGroup({
    required String title,
    required List<String> options,
    required List<bool> selectedValues,
    required List<Function(bool)> onChangedList,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        Wrap(
          spacing: 10.0,
          children: List.generate(options.length, (index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: selectedValues[index],
                  onChanged: (value) {
                    if (value != null) {
                      onChangedList[index](value);
                    }
                  },
                ),
                Text(options[index]),
              ],
            );
          }),
        ),
      ],
    );
  }
}
