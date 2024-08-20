import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/login/controllers/auth_controller.dart';
import '../../features/login/data/datasources/auth_remote_data_source.dart';
import '../../features/login/data/repositories/auth_repository_impl.dart';
import '../../features/login/domain/repositories/auth_repository.dart';
import '../../features/login/domain/usecases/login_use_case.dart';
import '../../features/login/domain/usecases/sign_up_use_case.dart';

// Instância global do GetIt para gerenciamento de injeção de dependências
final sl = GetIt.instance;

// Função para configurar a injeção de dependências
void setupInjection() {
  // Configura o DioClient
  setupDioClient();

  // Dependências externas
  sl.registerLazySingleton(() => const FlutterSecureStorage()); // Armazenamento seguro para senhas e tokens
  sl.registerLazySingleton(() => FlutterAppAuth()); // Autenticação com OAuth2/OpenID

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        appAuth: sl<FlutterAppAuth>(), // DataSource remoto de autenticação
      ));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: sl<AuthRemoteDataSource>(), // Implementação do repositório de autenticação
        secureStorage: sl<FlutterSecureStorage>(), // Passa o FlutterSecureStorage para o repositório
      ));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>())); // Caso de uso para login
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepository>())); // Caso de uso para cadastro

  // Controllers
  sl.registerLazySingleton(() => AuthController(
        loginUseCase: sl<LoginUseCase>(), // Controller para lidar com login
        signUpUseCase: sl<SignUpUseCase>(), // Controller para lidar com cadastro
      ));
}

// Função para configurar e registrar o Dio como cliente HTTP
void setupDioClient() {
  final dio = Dio(); // Instancia o Dio
  sl.registerLazySingleton(() => dio); // Registra o Dio como singleton
}
