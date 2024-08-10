import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../utils/constants.dart';

final getIt = GetIt.instance;

void setupDioClient() {
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
    return dio;
  });
}
