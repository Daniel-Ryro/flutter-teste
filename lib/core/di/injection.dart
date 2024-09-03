import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/account/controller/account_controller.dart';
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
import '../../features/viacep/controller/viacep_controller.dart';
import '../../features/viacep/data/datasources/viacep_remote_data_source.dart';
import '../../features/viacep/domain/repositories/viacep_repository.dart';
import '../../features/viacep/domain/usecases/get_cep_data.dart';
import '../utils/constants.dart';

// Instância global do GetIt para gerenciamento de injeção de dependências
final sl = GetIt.instance;

// Função para configurar a injeção de dependências
void setupInjection() {
  // Configura o DioClient
  setupDioClient();

  // Dependências externas
  sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage()); // Armazenamento seguro para senhas e tokens
  sl.registerLazySingleton<FlutterAppAuth>(
      () => FlutterAppAuth()); // Autenticação com OAuth2/OpenID

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        appAuth: sl<FlutterAppAuth>(), // DataSource remoto de autenticação
      ));

  sl.registerLazySingleton<AccountRemoteDataSource>(
      () => AccountRemoteDataSourceImpl(
            dio: sl<Dio>(), // Usa a instância do Dio injetada
            secureStorage: sl<
                FlutterSecureStorage>(), // Usa a instância do FlutterSecureStorage injetada
          ));

  // Registre o ViaCepRemoteDataSource
  sl.registerLazySingleton<ViaCepRemoteDataSource>(
      () => ViaCepRemoteDataSource(sl<Dio>()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: sl<AuthRemoteDataSource>(),
        secureStorage: sl<FlutterSecureStorage>(),
      ));

  sl.registerLazySingleton<AccountRepository>(() => AccountRepositoryImpl(
        remoteDataSource: sl<AccountRemoteDataSource>(),
      ));

  sl.registerLazySingleton<ViaCepRepository>(() => ViaCepRepositoryImpl(
        sl<ViaCepRemoteDataSource>(),
      ));

  // Use cases
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(sl<AuthRepository>())); // Caso de uso para login
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(sl<AuthRepository>())); // Caso de uso para cadastro
  sl.registerLazySingleton<GetAccountData>(
      () => GetAccountData(sl<AccountRepository>())); // Caso de uso para obter dados da conta
  sl.registerLazySingleton<GetCepData>(() => GetCepData(sl<ViaCepRepository>()));

  // Controllers
  sl.registerLazySingleton<AuthController>(() => AuthController(
        loginUseCase: sl<LoginUseCase>(), // Controller para lidar com login
        signUpUseCase: sl<SignUpUseCase>(), // Controller para lidar com cadastro
        authRepository: sl<AuthRepository>(), // Adiciona o AuthRepository aqui
      ));

  // Corrigido para passar o parâmetro correto para o construtor
  sl.registerFactory<AccountController>(() => AccountController(
        sl<GetAccountData>(), // Passa o GetAccountData como argumento posicional
      ));

  sl.registerFactory<ViaCepController>(
      () => ViaCepController(sl<GetCepData>()));
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

  sl.registerLazySingleton<Dio>(() => dio); // Registra o Dio como singleton
}
