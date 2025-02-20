import 'package:dio/dio.dart';
import 'package:h_c_1/auth/infrastructure/errors/auth_errors.dart';
import 'package:h_c_1/citas_medicTR/domain/datasources/appointment_datasource.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/cita.entity.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/registerCita.entity.dart';
import 'package:h_c_1/config/constants/enviroments.dart';
import 'package:h_c_1/shared/infrastructure/services/key_value_storage_service_impl.dart';

class AppointmentDatasourceImpl implements AppointmentDatasource {
  final keyValueStorageService = KeyValueStorageServiceImpl();
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer '},
  ));

  Future<String?> _getToken() async {
    return await keyValueStorageService.getValue<String>('token');
  }

  Future<void> _setAuthorizationHeader() async {
    final token = await _getToken();
    print('token: $token');
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  @override
  Future<void> createAppointment(CreateAppointments appointment) async {
    try {
      await _setAuthorizationHeader();

      final response =
          await dio.post('/appointments', data: appointment.toJson());

      print("response: ${response.data}");
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error al crear cita');
      }
      if (error.response?.statusCode == 401) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'No has iniciado sesión');
      }
      if (error.response?.statusCode == 403) {
        print('Error: ${error.response?.data}');
        throw CustomError(error.response?.data['message'] ??
            'No tienes permisos suficientes');
      }
      if (error.response?.statusCode == 404) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'No se encontraron citas');
      }
      if (error.response?.statusCode == 500) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error en el servidor');
      }

      print('Error: $error');
      throw CustomError('Error al crear cita');
    }
  }

  @override
  Future<void> deleteAppointment(Appointments appointment) {
    // TODO: implement deleteAppointment
    throw UnimplementedError();
  }

  @override
  Future<List<Appointments>> getAppointmentsByStatus(String status) async {
    try {
      print('getAppointmentsByStatus  $status');
      await _setAuthorizationHeader();
      final response =
          await dio.get('/appointments/find-appointments-unassigned');
      print("response: ${response.data['data']}");
      final appointments = (response.data['data'] as List)
          .map((appointment) => Appointments.fromJson(appointment))
          .toList();
      print("appointments: $appointments");
      return appointments;
    } catch (e) {
      final error = e as DioError;

      if (error.response?.statusCode == 400) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error al obtener citas');
      }
      if (error.response?.statusCode == 401) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'No has iniciado sesión');
      }
      if (error.response?.statusCode == 403) {
        print('Error: ${error.response?.data}');
        throw CustomError(error.response?.data['message'] ??
            'No tienes permisos suficientes');
      }
      if (error.response?.statusCode == 404) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'No se encontraron citas');
      }
      if (error.response?.statusCode == 500) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error en el servidor');
      }

      print('Error: $e');
      throw CustomError('Error al obtener citas');
    }
  }

  @override
  Future<List<Appointments>> getAppointmentsByDate(DateTime date) async {
    try {
      await _setAuthorizationHeader();
      final response =
          await dio.get('/appointments/find-by-medic-and-date?date=$date');
      print("response: ${response.data['data']}");
      final appointments = (response.data['data'] as List)
          .map((appointment) => Appointments.fromJson(appointment))
          .toList();
      return appointments;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  Future<void> updateAppointment(Appointments appointment) async {
    try {
      await _setAuthorizationHeader();
      print('appointment: ${appointment.toJson()}');
      final response = await dio.patch(
          '/appointments/status-and-assigned-doctor/${appointment.id}',
          data: {
            "status": appointment.status,
          });

      print("response: ${response.data}");
    } catch (e) {
      final error = e as DioError;

      if (error.response?.statusCode == 400) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error al actualizar cita');
      }
      if (error.response?.statusCode == 401) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'No has iniciado sesión');
      }
      if (error.response?.statusCode == 403) {
        print('Error: ${error.response?.data}');
        throw CustomError(error.response?.data['message'] ??
            'No tienes permisos suficientes');
      }
      if (error.response?.statusCode == 404) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'No se encontraron citas');
      }
      if (error.response?.statusCode == 500) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error en el servidor');
      }

      print('Error: $e');
      throw CustomError('Error al actualizar cita');
    }
  }
}
