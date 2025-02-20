import 'package:h_c_1/patient/domain/entities/patient_entity.dart';

abstract class PatientRepository {
  Future<List<Patient>> getPatients();
  Future<Patient> getPatientByDni(String dni);
}
