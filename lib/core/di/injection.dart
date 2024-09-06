import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/account/controller/account_controller.dart';
import '../../features/account/domain/usecases/add_executor.dart';
import '../../features/account/domain/usecases/get_update_executor.dart';
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
import '../../features/account/domain/usecases/get_executors.dart';
import '../../features/viacep/controller/viacep_controller.dart';
import '../../features/viacep/data/datasources/viacep_remote_data_source.dart';
import '../../features/viacep/domain/repositories/viacep_repository.dart';
import '../../features/viacep/domain/usecases/get_cep_data.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void setupInjection() {
  // Configura o DioClient
  setupDioClient();

  // Dependências externas
  sl.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());
  sl.registerLazySingleton<FlutterAppAuth>(() => FlutterAppAuth());

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        appAuth: sl<FlutterAppAuth>(),
      ));

  sl.registerLazySingleton<AccountRemoteDataSource>(
      () => AccountRemoteDataSourceImpl(
            dio: sl<Dio>(),
            secureStorage: sl<FlutterSecureStorage>(),
          ));

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
      () => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton<GetAccountData>(
      () => GetAccountData(sl<AccountRepository>()));
  sl.registerLazySingleton<GetExecutors>(() =>
      GetExecutors(sl<AccountRepository>())); // Registra o novo caso de uso
  sl.registerLazySingleton<GetCepData>(
      () => GetCepData(sl<ViaCepRepository>()));
  // sl.registerLazySingleton<UpdateExecutor>(
  //     () => UpdateExecutor(sl<AccountRepository>()));
  sl.registerLazySingleton<AddExecutor>(
      () => AddExecutor(sl<AccountRepository>()));

  // Controllers
  sl.registerLazySingleton<AuthController>(() => AuthController(
        loginUseCase: sl<LoginUseCase>(),
        signUpUseCase: sl<SignUpUseCase>(),
        authRepository: sl<AuthRepository>(),
      ));

  sl.registerFactory<AccountController>(() => AccountController(
        sl<GetAccountData>(),
        sl<GetExecutors>(), // Passa o novo caso de uso para o controlador
        //sl<UpdateExecutor>(),
        sl<AddExecutor>(),
      ));

  sl.registerFactory<ViaCepController>(
      () => ViaCepController(sl<GetCepData>()));
}
