import 'package:dio/dio.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/account/controllers/auth_controller.dart';
import '../../features/account/data/datasources/auth_remote_data_source.dart';
import '../../features/account/data/repositories/auth_repository_impl.dart';
import '../../features/account/domain/repositories/auth_repository.dart';
import '../../features/account/domain/usecases/login_use_case.dart';
import '../../features/account/domain/usecases/sign_up_use_case.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void setupInjection() {
  // Certifique-se de registrar o Dio apenas uma vez
  if (!GetIt.instance.isRegistered<Dio>()) {
    setupDioClient();
  }

  // External dependencies
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => FlutterAppAuth());

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        appAuth: sl<FlutterAppAuth>(),
      ));
  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: sl<AuthRemoteDataSource>(),
      ));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepository>()));

  // Controllers
  sl.registerLazySingleton(() => AuthController(
        loginUseCase: sl<LoginUseCase>(),
        signUpUseCase: sl<SignUpUseCase>(),
      ));
}

void setupDioClient() {
  final dio = Dio();
  sl.registerLazySingleton(() => dio);
}
