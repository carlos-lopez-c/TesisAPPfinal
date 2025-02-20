import 'package:h_c_1/citas_medicTR/domain/datasources/appointment_datasource.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/cita.entity.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/registerCita.entity.dart';
import 'package:h_c_1/citas_medicTR/domain/repositories/appointment_repository.dart';
import 'package:h_c_1/citas_medicTR/infrastructure/datasources/appointment_datasource_impl.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final AppointmentDatasource datasource;

  AppointmentRepositoryImpl({AppointmentDatasource? datasource})
      : datasource = datasource ?? AppointmentDatasourceImpl();
  @override
  Future<void> createAppointment(CreateAppointments appointment) {
    return datasource.createAppointment(appointment);
  }

  @override
  Future<void> deleteAppointment(Appointments appointment) {
    return datasource.deleteAppointment(appointment);
  }

  @override
  Future<List<Appointments>> getAppointmentsByStatus(String status) {
    print('getAppointmentsByStatus');
    return datasource.getAppointmentsByStatus(status);
  }

  @override
  Future<void> updateAppointment(Appointments appointment) {
    return datasource.updateAppointment(appointment);
  }

  @override
  Future<List<Appointments>> getAppointmentsByDate(DateTime date) {
    return datasource.getAppointmentsByDate(date);
  }
}
