import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/hc_ps/presentation/providers/hc_ps_form_provider.dart';
import '/hc_ps/presentation/screens/search_hc_ps_adults.dart';
import '../widgets/headerPS.dart';

class HistoriaClinicaAdultPS extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hcState = ref.watch(hcPsAdultFormProvider);
    final hcNotifier = ref.read(hcPsAdultFormProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Área de Psicología'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              headerPSWidget(
                textoDinamico: 'HISTORIA CLÍNICA DE ADULTOS',
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusquedaPsA()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'BUSCAR HISTORIA CLÍNICA',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              _buildSection('1.- DATOS PERSONALES:'),
              _buildFormField(
                label: 'Nombres y Apellidos',
                initialValue: hcState.createHcPsAdult.nombreCompleto,
                onChanged: hcNotifier.setNombreCompleto,
                validator: (value) => _validateRequired(value),
              ),
              _buildFormField(
                label: 'Fecha de Nacimiento (AAAA-MM-DD)',
                initialValue:
                    hcState.createHcPsAdult.fechaNacimiento.toString(),
                onChanged: (value) => hcNotifier.setFechaNacimiento(
                    DateTime.tryParse(value) ?? DateTime.now()),
                validator: (value) => _validateDate(value),
              ),
              _buildFormField(
                label: 'Teléfono',
                initialValue: hcState.createHcPsAdult.telefono,
                onChanged: hcNotifier.setTelefono,
                keyboardType: TextInputType.phone,
                validator: (value) => _validatePhone(value),
              ),
              _buildFormField(
                label: 'Curso Escolar Actual',
                initialValue: hcState.createHcPsAdult.curso,
                onChanged: hcNotifier.setCurso,
                validator: (value) => _validateRequired(value),
              ),
              _buildFormField(
                label: 'Institución',
                initialValue: hcState.createHcPsAdult.institucion,
                onChanged: hcNotifier.setInstitucion,
                validator: (value) => _validateRequired(value),
              ),
              _buildFormField(
                label: 'Dirección',
                initialValue: hcState.createHcPsAdult.direccion,
                onChanged: hcNotifier.setDireccion,
                validator: (value) => _validateRequired(value),
              ),
              _buildFormField(
                label: 'Remisión',
                initialValue: hcState.createHcPsAdult.remision,
                onChanged: hcNotifier.setRemision,
                validator: (value) => _validateRequired(value),
              ),
              _buildFormField(
                label: 'Fecha de Evaluación (AAAA-MM-DD)',
                initialValue: hcState.createHcPsAdult.fechaEvalucion.toString(),
                onChanged: (value) => hcNotifier.setFechaEvaluacion(
                    DateTime.tryParse(value) ?? DateTime.now()),
                validator: (value) => _validateDate(value),
              ),
              _buildFormField(
                label: 'Final de Cobertura',
                initialValue: hcState.createHcPsAdult.cobertura,
                onChanged: hcNotifier.setCobertura,
                validator: (value) => _validateRequired(value),
              ),
              _buildFormField(
                label: 'Observaciones',
                initialValue: hcState.createHcPsAdult.observaciones,
                onChanged: hcNotifier.setObservaciones,
                maxLines: 3,
                validator: (value) => _validateRequired(value),
              ),
              _buildFormField(
                label: 'Responsable',
                initialValue: hcState.createHcPsAdult.responsable,
                onChanged: hcNotifier.setResponsable,
                validator: (value) => _validateRequired(value),
              ),
              const SizedBox(height: 20),
              _buildSection('2.- MOTIVO DE CONSULTA:'),
              _buildFormField(
                label: 'Describa el motivo de la consulta',
                initialValue: hcState.createHcPsAdult.motivoConsulta,
                onChanged: hcNotifier.setMotivoConsulta,
                maxLines: 3,
                validator: (value) => _validateRequired(value),
              ),
              const SizedBox(height: 20),
              _buildSection('3.- DESENCADENANTES DE MOTIVO DE CONSULTA:'),
              _buildFormField(
                label: 'Describa los desencadenantes',
                initialValue:
                    hcState.createHcPsAdult.desencadenantesMotivoConsulta,
                onChanged: hcNotifier.setDesencadenantesMotivoConsulta,
                maxLines: 3,
                validator: (value) => _validateRequired(value),
              ),
              const SizedBox(height: 20),
              _buildSection('4.- ANTECEDENTES FAMILIARES:'),
              _buildFormField(
                label: 'Describa los antecedentes familiares',
                initialValue: hcState.createHcPsAdult.antecedenteFamiliares,
                onChanged: hcNotifier.setAntecedenteFamiliares,
                maxLines: 4,
                validator: (value) => _validateRequired(value),
              ),
              const SizedBox(height: 20),
              _buildSection('5.- PRUEBAS APLICADAS:'),
              _buildFormField(
                label: 'Describa las pruebas aplicadas',
                initialValue: hcState.createHcPsAdult.pruebasAplicadas,
                onChanged: hcNotifier.setPruebasAplicadas,
                maxLines: 3,
                validator: (value) => _validateRequired(value),
              ),
              const SizedBox(height: 20),
              _buildSection('6.- IMPRESIÓN DIAGNÓSTICA:'),
              _buildFormField(
                label: 'Describa la impresión diagnóstica',
                initialValue: hcState.createHcPsAdult.impresionDiagnostica,
                onChanged: hcNotifier.setImpresionDiagnostica,
                maxLines: 3,
                validator: (value) => _validateRequired(value),
              ),
              const SizedBox(height: 20),
              _buildSection('7.- ÁREAS DE INTERVENCIÓN:'),
              _buildFormField(
                label: 'Describa las áreas de intervención',
                initialValue: hcState.createHcPsAdult.areasIntervecion,
                onChanged: hcNotifier.setAreasIntervencion,
                maxLines: 3,
                validator: (value) => _validateRequired(value),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Procesando datos')),
            );
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  // 🔹 Sección con título estilizado
  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
    );
  }

  // 🔹 Campo de texto conectado al estado
  Widget _buildFormField({
    required String label,
    required String initialValue,
    required Function(String) onChanged,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        maxLines: maxLines,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  String? _validateRequired(String? value) =>
      (value == null || value.isEmpty) ? 'Este campo es obligatorio' : null;

  String? _validateDate(String? value) =>
      DateTime.tryParse(value ?? '') == null ? 'Fecha inválida' : null;

  String? _validatePhone(String? value) =>
      (value == null || value.length < 7) ? 'Número inválido' : null;
}
