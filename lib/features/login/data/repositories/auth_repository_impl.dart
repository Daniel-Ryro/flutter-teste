import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/token.dart';
import '../../domain/repositories/auth_repository.dart'; 
import '../datasources/auth_remote_data_source.dart'; 

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final FlutterSecureStorage secureStorage;

  // Construtor da classe que recebe as dependências necessárias.
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
  });

  // Método para realizar o login do usuário.
  @override
  Future<User> login() async {
    final user = await remoteDataSource.login();

    // Salva os tokens de forma segura após o login bem-sucedido.
    await secureStorage.write(key: 'idToken', value: user.idToken);
    await secureStorage.write(key: 'accessToken', value: user.accessToken);
    await secureStorage.write(key: 'refreshToken', value: user.refreshToken);

    return user;
  }

  // Método para realizar o cadastro do usuário.
  @override
  Future<User> signUp() async {
    final user = await remoteDataSource.signUp();

    // Salva os tokens de forma segura após o signUp bem-sucedido.
    await secureStorage.write(key: 'idToken', value: user.idToken);
    await secureStorage.write(key: 'accessToken', value: user.accessToken);
    await secureStorage.write(key: 'refreshToken', value: user.refreshToken);

    return user;
  }

  // Método para realizar o logout do usuário.
  @override
  Future<void> logout() async {
    final idToken = await secureStorage.read(key: 'idToken');
    if (idToken != null) {
      await remoteDataSource.logout(idToken);

      // Remove os tokens após o logout.
      await secureStorage.delete(key: 'idToken');
      await secureStorage.delete(key: 'accessToken');
      await secureStorage.delete(key: 'refreshToken');
    } else {
      throw Exception('Logout falhou: idToken não disponível.');
    }
  }
}
