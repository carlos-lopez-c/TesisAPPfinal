import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/hc_tr/presentation/providers/hc_form_general_provider.dart';

class AntecedentesPrenatalesWidget extends ConsumerWidget {
  const AntecedentesPrenatalesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hcState = ref.watch(hcGeneralProvider);
    final hcNotifier = ref.read(hcGeneralProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('4.1.- ANTECEDENTES PRENATALES'),
        _buildCheckboxList(
          title: 'Deseado / Planificado',
          value: hcState.createHcGeneral.antecedentesPersonales.deseado,
          onChanged: hcNotifier.onDeseadoChanged,
        ),
        _buildCheckboxList(
          title: 'Automedicación',
          value: hcState.createHcGeneral.antecedentesPersonales.automedicacion,
          onChanged: hcNotifier.onAutomedicacionChanged,
        ),
        _buildCheckboxList(
          title: 'Depresión',
          value: hcState.createHcGeneral.antecedentesPersonales.depresion,
          onChanged: hcNotifier.onDepresionChanged,
        ),
        _buildCheckboxList(
          title: 'Estrés',
          value: hcState.createHcGeneral.antecedentesPersonales.estres,
          onChanged: hcNotifier.onEstresChanged,
        ),
        _buildCheckboxList(
          title: 'Ansiedad',
          value: hcState.createHcGeneral.antecedentesPersonales.ansiedad,
          onChanged: hcNotifier.onAnsiedadChanged,
        ),
        _buildCheckboxList(
          title: 'Traumatismo',
          value: hcState.createHcGeneral.antecedentesPersonales.traumatismo,
          onChanged: hcNotifier.onTraumatismoChanged,
        ),
        _buildCheckboxList(
          title: 'Radiaciones',
          value: hcState.createHcGeneral.antecedentesPersonales.radiaciones,
          onChanged: hcNotifier.onRadiacionesChanged,
        ),
        _buildCheckboxList(
          title: 'Medicina',
          value: hcState.createHcGeneral.antecedentesPersonales.medicina,
          onChanged: hcNotifier.onMedicinaChanged,
        ),
        _buildCheckboxList(
          title: 'Riesgos de aborto',
          value: hcState.createHcGeneral.antecedentesPersonales.riesgoDeAborto,
          onChanged: hcNotifier.onRiesgoDeAbortoChanged,
        ),
        _buildCheckboxList(
          title: 'Maltrato físico',
          value: hcState.createHcGeneral.antecedentesPersonales.maltratoFisico,
          onChanged: hcNotifier.onMaltratoFisicoChanged,
        ),
        _buildCheckboxList(
          title: 'Consumo de drogas',
          value: hcState.createHcGeneral.antecedentesPersonales.consumoDeDrogas,
          onChanged: hcNotifier.onConsumoDeDrogasChanged,
        ),
        _buildCheckboxList(
          title: 'Consumo de alcohol',
          value:
              hcState.createHcGeneral.antecedentesPersonales.consumoDeAlcohol,
          onChanged: hcNotifier.onConsumoDeAlcoholChanged,
        ),
        _buildCheckboxList(
          title: 'Consumo de tabaco',
          value: hcState.createHcGeneral.antecedentesPersonales.consumoDeTabaco,
          onChanged: hcNotifier.onConsumoDeTabacoChanged,
        ),
        _buildCheckboxList(
          title: 'Hipertensión',
          value: hcState.createHcGeneral.antecedentesPersonales.hipertension,
          onChanged: hcNotifier.onHipertensionChanged,
        ),
        _buildCheckboxList(
          title: 'Dieta balanceada',
          value: hcState.createHcGeneral.antecedentesPersonales.dietaBalanceada,
          onChanged: hcNotifier.onDietaBalanceadaChanged,
        ),
        const Divider(),
      ],
    );
  }

  // 🔹 Función para generar una sección con título estilizado
  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  // 🔹 Función para generar una lista de checkboxes conectada al estado
  Widget _buildCheckboxList({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: (newValue) => onChanged(newValue ?? false),
    );
  }
}
