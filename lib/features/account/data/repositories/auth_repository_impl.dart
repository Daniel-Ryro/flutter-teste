

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login() async {
    return await remoteDataSource.login();
  }

  @override
  Future<User> signUp() async {
    return await remoteDataSource.signUp();
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
  }
}
