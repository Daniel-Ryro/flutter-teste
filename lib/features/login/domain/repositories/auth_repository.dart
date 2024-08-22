
import '../entities/token.dart';

abstract class AuthRepository {
  Future<User> login();
  Future<User> signUp();
  Future<void> logout();
}
