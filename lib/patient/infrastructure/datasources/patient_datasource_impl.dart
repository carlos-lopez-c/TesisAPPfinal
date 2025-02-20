import 'package:dio/dio.dart';
import 'package:h_c_1/auth/infrastructure/errors/auth_errors.dart';
import 'package:h_c_1/config/constants/enviroments.dart';
import 'package:h_c_1/patient/domain/datasources/patient_datasource.dart';
import 'package:h_c_1/patient/domain/entities/patient_entity.dart';
import 'package:h_c_1/shared/infrastructure/services/key_value_storage_service_impl.dart';

class PatientDatasourceImpl implements PatientDatasource {
  final keyValueStorageService = KeyValueStorageServiceImpl();
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
    headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer '},
  ));

  Future<String?> _getToken() async {
    final token = await keyValueStorageService.getValue<String>('token');
    print('token2: $token');
    return token;
  }

  Future<void> _setAuthorizationHeader() async {
    final token = await _getToken();
    print('token: $token');
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  @override
  Future<Patient> getPatientByDni(String dni) async {
    try {
      await _setAuthorizationHeader();
      print('getPatientByDni  $dni');
      final response = await dio.get('/patients/find-by-dni?dni=$dni');
      print("response: ${response.data}");
      final patient = Patient.fromJson(response.data);
      return patient;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        print('Error: ${e.response?.data}');
        throw CustomError(e.response?.data['message'] ??
            'Error al obtener el paciente con el dni: $dni');
      }
      if (e.response?.statusCode == 401) {
        print('Error: ${e.response?.data}');
        throw CustomError(e.response?.data['message'] ??
            'Error al obtener el paciente con el dni: $dni');
      }
      if (e.response?.statusCode == 403) {
        print('Error: ${e.response?.data}');
        throw CustomError(e.response?.data['message'] ??
            'Error al obtener el paciente con el dni: $dni');
      }
      if (e.response?.statusCode == 500) {
        print('Error: ${e.response?.data}');
        throw CustomError(e.response?.data['message'] ??
            'Error al obtener el paciente con el dni: $dni');
      }
      if (e.response?.statusCode == 404) {
        print('Error: ${e.response?.data}');
        throw CustomError(e.response?.data['message'] ??
            'Error al obtener el paciente con el dni: $dni');
      }

      throw CustomError(
          'Error al obtener el paciente con el dni: $dni, error: $e');
    } catch (e) {
      print('Error: $e');
      throw CustomError(
          'Error al obtener el paciente con el dni: $dni, error: $e');
    }
  }

  @override
  Future<List<Patient>> getPatients() {
    // TODO: implement getPatients
    throw UnimplementedError();
  }
}
