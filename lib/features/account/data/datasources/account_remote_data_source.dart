import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_model.dart';

abstract class AccountRemoteDataSource {
  Future<UserModel> getAccountData();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  AccountRemoteDataSourceImpl({
    required this.dio,
    required this.secureStorage,
  });

  @override
  Future<UserModel> getAccountData() async {
    // Recuperando o token de acesso do storage seguro
    String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }

    try {
      // Fazendo a requisição GET
      final response = await dio.get(
        '/v1/Account',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
          validateStatus: (status) {
            // Aceita qualquer código de status para permitir tratamento personalizado
            return status != null && status < 500;
          },
        ),
      );

      // Verificando o código de status
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception("Erro de autenticação: Token inválido ou expirado.");
      } else {
        throw Exception(
            "Erro ao buscar dados da conta: Código ${response.statusCode}");
      }
    } on DioException catch (e) {
      // Tratamento de erros específicos do Dio
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    } catch (e) {
      // Tratamento de erros gerais
      throw Exception("Erro inesperado: ${e.toString()}");
    }
  }
}
