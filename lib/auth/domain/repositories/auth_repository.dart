import 'package:h_c_1/auth/domain/entities/user_entities.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> checkAuthStatus(String token);
}
