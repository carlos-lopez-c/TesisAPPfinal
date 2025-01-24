import 'package:dio/dio.dart';
import 'package:h_c_1/auth/domain/datasources/auth_datasource.dart';
import 'package:h_c_1/auth/domain/entities/user_entities.dart';
import 'package:h_c_1/auth/infrastructure/errors/auth_errors.dart';
import 'package:h_c_1/auth/infrastructure/mappers/user_mapper.dart';
import 'package:h_c_1/config/constants/enviroments.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
    headers: {'Content-Type': 'application/json'},
  ));
  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/check-status',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token incorrecto');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      print(dio.options.baseUrl);
      print('email: $email, password: $password');
      print('Request URL: ${dio.options.baseUrl}/auth/login');
      print('Request Headers: ${dio.options.headers}');
      print('Request Body: {"email": "$email", "password": "$password"}');
      final response = await dio
          .post('/auth/login/', data: {'email': email, 'password': password});
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      if (e.type == DioExceptionType.connectionError) {
        throw CustomError('Error en la conexión');
      }

      print("Error: $e");
      throw Exception();
    } catch (e) {
      print(e);
      throw Exception();
    }
  }
}
