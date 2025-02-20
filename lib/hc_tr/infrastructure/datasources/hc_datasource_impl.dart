import 'package:dio/dio.dart';
import 'package:h_c_1/auth/infrastructure/errors/auth_errors.dart';
import 'package:h_c_1/config/constants/enviroments.dart';
import 'package:h_c_1/hc_tr/domain/datasources/hc_datasource.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_adult/hc_adult_entity.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_general/hc_general_entity.dart';
import 'package:h_c_1/hc_tr/domain/entities/hc_voice/create_hc_voice_entity.dart';
import 'package:h_c_1/shared/infrastructure/services/key_value_storage_service_impl.dart';

class HcDatasourceImpl implements HcDatasource {
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
  Future<void> createHcGeneral(CreateHcGeneral hc) async {
    try {
      await _setAuthorizationHeader();
      final response =
          await dio.post('/hc/medical-history-terapy', data: hc.toJson());

      print("response: ${response.data}");
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        print('Error: ${error.response?.data}');
        throw CustomError(error.response?.data['message'] ??
            'Error al crear la historia clínica');
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
        throw CustomError(error.response?.data['message'] ??
            'No se encontraron la historia clínica');
      }

      if (error.response?.statusCode == 500) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error en el servidor');
      }

      print('Error: $error');
    } catch (e) {
      print('Error: $e');
      throw CustomError('Error al crear la historia clínica');
    }
  }

  @override
  Future<void> createHcAdult(CreateHcAdultEntity hc) async {
    try {
      await _setAuthorizationHeader();
      final response =
          await dio.post('/hc/adult-dietary-anamnesis', data: hc.toJson());

      print("response: ${response.data}");
    } on DioException catch (error) {
      if (error.response?.statusCode == 400) {
        print('Error: ${error.response?.data}');
        throw CustomError(error.response?.data['message'] ??
            'Error al crear la historia clínica');
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
        throw CustomError(error.response?.data['message'] ??
            'No se encontraron la historia clínica');
      }

      if (error.response?.statusCode == 500) {
        print('Error: ${error.response?.data}');
        throw CustomError(
            error.response?.data['message'] ?? 'Error en el servidor');
      }

      print('Error: $error');
    } catch (e) {
      print('Error: $e');
      throw CustomError('Error al crear la historia clínica');
    }
  }

  @override
  Future<void> createHcVoice(CreateHcVoice hc) {
    // TODO: implement createHcVoice
    throw UnimplementedError();
  }

  @override
  Future<CreateHcGeneral> getHcGeneral(String cedula) async {
    try {
      await _setAuthorizationHeader();
      print('cedula: $cedula');
      final response = await dio.get('/hc/medical-history-terapy/$cedula');
      final data = response.data['hc'];
      print('response: $data');
      return CreateHcGeneral.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        print('Error: ${e.response?.data}');
        throw CustomError(e.response?.data['message'] ??
            'Error al obtener la historia clínica');
      }
      if (e.response?.statusCode == 401) {
        print('Error: ${e.response?.data}');
        throw CustomError(
            e.response?.data['message'] ?? 'No has iniciado sesión');
      }

      if (e.response?.statusCode == 403) {
        print('Error: ${e.response?.data}');
        throw CustomError(
            e.response?.data['message'] ?? 'No tienes permisos suficientes');
      }

      if (e.response?.statusCode == 404) {
        print('Error: ${e.response?.data}');
        throw CustomError(e.response?.data['message'] ??
            'No se encontraron la historia clínica');
      }

      if (e.response?.statusCode == 500) {
        print('Error: ${e.response?.data}');
        throw CustomError(
            e.response?.data['message'] ?? 'Error en el servidor');
      }

      print('Error: $e');
      throw CustomError('Error al obtener la historia clínica');
    } catch (e) {
      print('Error: $e');
      throw CustomError('Error al obtener la historia clínica');
    }
  }
}
