import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart'; 
import '../datasources/auth_remote_data_source.dart'; 

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  // O construtor da classe recebe uma instância de AuthRemoteDataSource.
  // Isso segue o princípio da Inversão de Dependências, facilitando o teste e a troca de implementações.
  AuthRepositoryImpl({required this.remoteDataSource});

  // Implementação do método de login definido na interface AuthRepository.
  // Este método delega a responsabilidade de autenticação ao data source remoto.
  @override
  Future<User> login() async {
    return await remoteDataSource.login(); // Chama o método login() no data source remoto e retorna o resultado.
  }

  // Implementação do método de cadastro (sign up) definido na interface AuthRepository.
  // Assim como o login, a responsabilidade é delegada ao data source remoto.
  @override
  Future<User> signUp() async {
    return await remoteDataSource.signUp(); // Chama o método signUp() no data source remoto e retorna o resultado.
  }

  // Implementação do método de logout definido na interface AuthRepository.
  // Este método apenas delega a responsabilidade de logout ao data source remoto.
  @override
  Future<void> logout() async {
    await remoteDataSource.logout(); // Chama o método logout() no data source remoto.
  }
}
