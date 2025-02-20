import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h_c_1/hc_ps/domain/entities/hc_ps_adult/create_hc_adult.dart';
import 'package:h_c_1/patient/domain/repositories/patient_repository.dart';
import 'package:h_c_1/patient/infrastructure/repositories/patient_repository_impl.dart';

// 📌 Estado inicial del formulario
final initialPsAdult = CreateHcPsAdult(
  patientId: '',
  antecedenteFamiliares: '',
  areasIntervecion: '',
  cobertura: '',
  curso: '',
  desencadenantesMotivoConsulta: '',
  direccion: '',
  estructuraFamiliar: '',
  fechaCreacion: DateTime.now(),
  fechaEvalucion: DateTime.now(),
  fechaNacimiento: DateTime.now(),
  impresionDiagnostica: '',
  institucion: '',
  motivoConsulta: '',
  nombreCompleto: '',
  observaciones: '',
  pruebasAplicadas: '',
  remision: '',
  responsable: '',
  telefono: '',
);

class HcFormAdultState {
  final bool loading;
  final String errorMessage;
  final CreateHcPsAdult createHcPsAdult;
  final String cedula;

  HcFormAdultState({
    this.loading = false,
    this.errorMessage = '',
    required this.createHcPsAdult,
    this.cedula = '',
  });

  HcFormAdultState copyWith({
    bool? loading,
    String? errorMessage,
    CreateHcPsAdult? createHcPsAdult,
    String? cedula,
  }) {
    return HcFormAdultState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      createHcPsAdult: createHcPsAdult ?? this.createHcPsAdult,
      cedula: cedula ?? this.cedula,
    );
  }
}

// 📌 Provider para la historia clínica psicológica
final hcPsAdultFormProvider =
    StateNotifierProvider.autoDispose<HcPsAdultFormNotifier, HcFormAdultState>(
  (ref) {
    final patientRepo = PatientRepositoryImpl();
    return HcPsAdultFormNotifier(patientRepository: patientRepo);
  },
);

class HcPsAdultFormNotifier extends StateNotifier<HcFormAdultState> {
  final PatientRepository patientRepository;

  HcPsAdultFormNotifier({required this.patientRepository})
      : super(HcFormAdultState(createHcPsAdult: initialPsAdult));

  // 🔹 Métodos para actualizar los campos
  void setPatientId(String patientId) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(patientId: patientId));
  }

  void setAntecedenteFamiliares(String value) {
    state = state.copyWith(
        createHcPsAdult:
            state.createHcPsAdult.copyWith(antecedenteFamiliares: value));
  }

  void setAreasIntervencion(String value) {
    state = state.copyWith(
        createHcPsAdult:
            state.createHcPsAdult.copyWith(areasIntervecion: value));
  }

  void setCobertura(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(cobertura: value));
  }

  void setCurso(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(curso: value));
  }

  void setDesencadenantesMotivoConsulta(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult
            .copyWith(desencadenantesMotivoConsulta: value));
  }

  void setDireccion(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(direccion: value));
  }

  void setEstructuraFamiliar(String value) {
    state = state.copyWith(
        createHcPsAdult:
            state.createHcPsAdult.copyWith(estructuraFamiliar: value));
  }

  void setFechaCreacion(DateTime value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(fechaCreacion: value));
  }

  void setFechaEvaluacion(DateTime value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(fechaEvalucion: value));
  }

  void setFechaNacimiento(DateTime value) {
    state = state.copyWith(
        createHcPsAdult:
            state.createHcPsAdult.copyWith(fechaNacimiento: value));
  }

  void setImpresionDiagnostica(String value) {
    state = state.copyWith(
        createHcPsAdult:
            state.createHcPsAdult.copyWith(impresionDiagnostica: value));
  }

  void setInstitucion(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(institucion: value));
  }

  void setMotivoConsulta(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(motivoConsulta: value));
  }

  void setNombreCompleto(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(nombreCompleto: value));
  }

  void setObservaciones(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(observaciones: value));
  }

  void setPruebasAplicadas(String value) {
    state = state.copyWith(
        createHcPsAdult:
            state.createHcPsAdult.copyWith(pruebasAplicadas: value));
  }

  void setRemision(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(remision: value));
  }

  void setResponsable(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(responsable: value));
  }

  void setTelefono(String value) {
    state = state.copyWith(
        createHcPsAdult: state.createHcPsAdult.copyWith(telefono: value));
  }

  // 🔹 Método para buscar paciente por DNI y actualizar los datos
  void getPacienteByDni(String dni) async {
    try {
      print('🔹 Buscando paciente por DNI: $dni');
      final paciente = await patientRepository.getPatientByDni(dni);
      state = state.copyWith(
        cedula: dni,
        createHcPsAdult: state.createHcPsAdult.copyWith(
          patientId: paciente.id,
          nombreCompleto: '${paciente.firstname} ${paciente.lastname}',
          fechaNacimiento: paciente.birthdate,
        ),
      );
    } catch (e) {
      print('🔴 Error al obtener paciente: $e');
    }
  }

  // 🔹 Resetear formulario
  void reset() {
    state = HcFormAdultState(createHcPsAdult: initialPsAdult);
  }
}
