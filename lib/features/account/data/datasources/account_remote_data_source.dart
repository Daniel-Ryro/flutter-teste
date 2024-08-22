import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';

abstract class AccountRemoteDataSource {
  Future<UserModel> getAccountData();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  AccountRemoteDataSourceImpl({required this.dio, required this.secureStorage});

  @override
  Future<UserModel> getAccountData() async {
    String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }

    final response = await dio.get(
      '/v1/Account',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception("Erro ao buscar dados da conta");
    }
  }
}
