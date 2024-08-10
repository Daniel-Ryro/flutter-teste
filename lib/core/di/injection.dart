import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/account/controllers/auth_controller.dart';
import '../../features/account/data/datasources/auth_remote_data_source.dart';
import '../../features/account/data/repositories/auth_repository.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void setupInjection() {
  // Certifique-se de registrar o Dio apenas uma vez
  if (!GetIt.instance.isRegistered<Dio>()) {
    setupDioClient();
  }

  // External dependencies
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // Data Sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSource(
  //     appAuth: sl<FlutterAppAuth>(),
  //     secureStorage: sl<FlutterSecureStorage>(),
  //   ),
  // );

  // // Repositories
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepository(sl<AuthRemoteDataSource>()),
  // );

  // // Controllers
  // sl.registerLazySingleton<AuthController>(
  //   () => AuthController(sl<AuthRepository>()),
  // );
}
