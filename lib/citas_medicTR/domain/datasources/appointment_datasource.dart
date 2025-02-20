import 'package:h_c_1/citas_medicTR/domain/entities/cita.entity.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/registerCita.entity.dart';

abstract class AppointmentDatasource {
  Future<List<Appointments>> getAppointmentsByStatus(String status);
  Future<void> createAppointment(CreateAppointments appointment);
  Future<void> updateAppointment(Appointments appointment);
  Future<void> deleteAppointment(Appointments appointment);
  Future<List<Appointments>> getAppointmentsByDate(DateTime date);
}
