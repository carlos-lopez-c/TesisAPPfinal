import 'package:h_c_1/auth/domain/entities/user_entities.dart';
import 'package:h_c_1/citas_medicTR/domain/entities/cita.entity.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> checkAuthStatus(String token);
}
