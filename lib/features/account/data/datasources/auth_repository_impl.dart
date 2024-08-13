import '../../domain/entities/user.dart';
import '../datasources/auth_remote_data_source.dart';
import '../repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<User?> signIn() async {
    return await remoteDataSource.signIn();
  }

  @override
  Future<void> signOut() async {
    return await remoteDataSource.signOut();
  }
}
