import 'package:h_c_1/citas_medicTR/domain/entities/cita.entity.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/registerCita.entity.dart';

abstract class AppointmentRepository {
  Future<List<Appointments>> getAppointmentsByStatus(String status);
  Future<List<Appointments>> getAppointmentsByDate(DateTime date);
  Future<void> createAppointment(CreateAppointments appointment);
  Future<void> updateAppointment(Appointments appointment);
  Future<void> deleteAppointment(Appointments appointment);
}
