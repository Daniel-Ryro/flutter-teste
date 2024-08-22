import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/account/presentation/controllers/account_controller.dart';
import '../../features/login/controllers/auth_controller.dart';
import '../../features/login/data/datasources/auth_remote_data_source.dart';
import '../../features/login/data/repositories/auth_repository_impl.dart';
import '../../features/login/domain/repositories/auth_repository.dart';
import '../../features/login/domain/usecases/login_use_case.dart';
import '../../features/login/domain/usecases/sign_up_use_case.dart';
import '../../features/account/data/datasources/account_remote_data_source.dart';
import '../../features/account/data/repositories/account_repository_impl.dart';
import '../../features/account/domain/repositories/account_repository.dart';
import '../../features/account/domain/usecases/get_account_data.dart';
import '../utils/constants.dart'; // Certifique-se de importar a classe ApiConstants

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

  sl.registerLazySingleton<AccountRemoteDataSource>(() => AccountRemoteDataSourceImpl(
        dio: sl<Dio>(), // Usa a instância do Dio injetada
        secureStorage: sl<FlutterSecureStorage>(), // Usa a instância do FlutterSecureStorage injetada
      ));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: sl<AuthRemoteDataSource>(), // Implementação do repositório de autenticação
        secureStorage: sl<FlutterSecureStorage>(), // Passa o FlutterSecureStorage para o repositório
      ));

  sl.registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(
        remoteDataSource: sl<AccountRemoteDataSource>(), // Implementação do repositório de conta
      ));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>())); // Caso de uso para login
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepository>())); // Caso de uso para cadastro
  sl.registerLazySingleton(() => GetAccountData(sl<AccountRepository>())); // Caso de uso para obter dados da conta

  // Controllers
  sl.registerLazySingleton(() => AuthController(
        loginUseCase: sl<LoginUseCase>(), // Controller para lidar com login
        signUpUseCase: sl<SignUpUseCase>(), // Controller para lidar com cadastro
      ));

  // (Exemplo) Controller para Account
  sl.registerLazySingleton(() => AccountController(
        getAccountData: sl<GetAccountData>(), // Controller para lidar com os dados da conta
      ));
}

// Função para configurar e registrar o Dio como cliente HTTP
void setupDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl, // Define a URL base para todas as requisições
      headers: {
        'Accept': 'application/json', // Define o header padrão para aceitar respostas JSON
      },
    ),
  );

  // (Opcional) Adicionar interceptores para lidar com erros, log de requisições, etc.
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // Adicione aqui lógica para manipular a requisição antes de ser enviada
      return handler.next(options); // Continua com a requisição
    },
    onResponse: (response, handler) {
      // Adicione aqui lógica para manipular a resposta antes de ser entregue
      return handler.next(response); // Continua com a resposta
    },
    onError: (DioError e, handler) {
      // Adicione aqui lógica para manipular erros
      return handler.next(e); // Continua com o erro
    },
  ));

  sl.registerLazySingleton(() => dio); // Registra o Dio como singleton
}
