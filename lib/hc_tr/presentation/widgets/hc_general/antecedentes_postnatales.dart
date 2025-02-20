import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/hc_tr/presentation/providers/hc_form_general_provider.dart';

class AntecedentesPostnatalesWidget extends ConsumerWidget {
  const AntecedentesPostnatalesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hcState = ref.watch(hcGeneralProvider);
    final hcNotifier = ref.read(hcGeneralProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('4.3. ANTECEDENTES POSTNATALES'),

        // ✅ Alimentación
        _buildInlineCheckboxGroup(
          title: "Alimentación:",
          options: ["Materna", "Artificial", "Maticación"],
          selectedValues: [
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.alimentacion.materna,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.alimentacion.artificial,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.alimentacion.maticacion,
          ],
          onChangedList: [
            hcNotifier.onAlimentacionMaternaChanged,
            hcNotifier.onAlimentacionArtificialChanged,
            hcNotifier.onAlimentacionMaticacionChanged,
          ],
        ),
        const Divider(),

        // ✅ Desarrollo Motor Grueso
        _buildInlineCheckboxGroup(
          title: "Desarrollo motor grueso:",
          options: [
            "Control céfalico",
            "Gateo",
            "Marcha",
            "Sedeestación",
            "Sincinesias",
            "Sube y baja gradas",
            "Rotación de pies",
          ],
          selectedValues: [
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.desarrolloMotorGrueso.controlCefalico,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.desarrolloMotorGrueso.gateo,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.desarrolloMotorGrueso.marcha,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.desarrolloMotorGrueso.sedestacion,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.desarrolloMotorGrueso.sincinesias,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.desarrolloMotorGrueso.subeBajaGradas,
            hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.desarrolloMotorGrueso.rotacionPies,
          ],
          onChangedList: [
            hcNotifier.onControlCefalicoChanged,
            hcNotifier.onGateoChanged,
            hcNotifier.onMarchaChanged,
            hcNotifier.onSedestacionChanged,
            hcNotifier.onSincinesiasChanged,
            hcNotifier.onSubeBajaGradasChanged,
            hcNotifier.onRotacionPiesChanged,
          ],
        ),
        const Divider(),

        // ✅ Sección de Reflejos Primitivos
        Center(child: _buildSection('REFLEJOS PRIMITIVOS')),
        Container(
          height: 3.0,
          width: 100.0,
          color: const Color.fromARGB(112, 75, 107, 176),
        ),

        _buildRadioButtonGroupBool(
          title: "Palmar - Plantar",
          options: ["SI", "NO"],
          selectedValue: hcState.createHcGeneral.antecedentesPerinatales
              .antecedentesPostnatales.reflejosPrimitivos.palmar,
          onChanged: hcNotifier.onPalmarChanged,
        ),
        _buildRadioButtonGroupBool(
            title: "Moro",
            options: ["SI", "NO"],
            selectedValue: hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.reflejosPrimitivos.moro,
            onChanged: (value) => hcNotifier.onMoroChanged(value)),
        _buildRadioButtonGroupBool(
            title: "Presión",
            options: ["SI", "NO"],
            selectedValue: hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.reflejosPrimitivos.presion,
            onChanged: hcNotifier.onPresionChanged),
        _buildRadioButtonGroupBool(
            title: "De búsqueda",
            options: ["SI", "NO"],
            selectedValue: hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.reflejosPrimitivos.deBusqueda,
            onChanged: (value) => hcNotifier.onDeBusquedaChanged(value)),
        _buildRadioButtonGroupBool(
            title: "Banbiski",
            options: ["SI", "NO"],
            selectedValue: hcState.createHcGeneral.antecedentesPerinatales
                .antecedentesPostnatales.reflejosPrimitivos.banbiski,
            onChanged: (value) => hcNotifier.onBanbiskiChanged(value)),
      ],
    );
  }

  // 🔹 Sección con título estilizado
  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }

  // 🔹 Grupo de checkbox en línea
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

  // 🔹 Grupo de botones de radio

  Widget _buildRadioButtonGroupBool({
    required String title,
    required List<String> options,
    required bool selectedValue,
    required Function(bool) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        Wrap(
          spacing: 20.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.start,
          children: options.map((option) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: option == "SI",
                  groupValue: selectedValue,
                  onChanged: (value) => onChanged(value as bool),
                ),
                Text(option),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
