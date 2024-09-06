import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/executor.dart';
import '../models/user_model.dart';
import '../models/executor_model.dart';

abstract class AccountRemoteDataSource {
  Future<UserModel> getAccountData();
  Future<List<ExecutorModel>> getExecutors();
  Future<void> updateExecutor(Executor executor);
  Future<void> addExecutor(Executor executor);
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
    String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }

    try {
      final response = await dio.get(
        '/v1/Account',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception("Erro de autenticação: Token inválido ou expirado.");
      } else {
        throw Exception(
            "Erro ao buscar dados da conta: Código ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: ${e.toString()}");
    }
  }

  @override
  Future<List<ExecutorModel>> getExecutors() async {
    String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }

    try {
      final response = await dio.get(
        '/v1/Account/Executors',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> executorsJson = response.data as List<dynamic>;
        return executorsJson
            .map((executor) => ExecutorModel.fromJson(executor))
            .toList();
      } else if (response.statusCode == 401) {
        throw Exception("Erro de autenticação: Token inválido ou expirado.");
      } else {
        throw Exception(
            "Erro ao buscar dados dos executores: Código ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: ${e.toString()}");
    }
  }

  // Método para enviar a requisição HTTP com os dados necessários
  Future<void> _sendRequest(String url, Map<String, dynamic> data) async {
    String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }

    try {
      final response = await dio.patch(
        url,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
      );

      if (response.statusCode != 200) {
        throw Exception("Erro ao atualizar executor: Código ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    }
  }

  @override
  Future<void> updateExecutor(Executor executor) async {
    final data = executor.toJson();
    await _sendRequest('/v1/Account/Executors/${executor.id}', data);
  }

  @override
  Future<void> addExecutor(Executor executor) async {
    // Passo 1: Obter a lista atual de executores
    List<ExecutorModel> executors = await getExecutors();

    // Passo 2: Adicionar o novo executor à lista existente
    executors.add(executor as ExecutorModel);

    // Passo 3: Converter a lista para JSON e enviar a requisição
    final data = {
      "executors": executors.map((executor) => executor.toJson()).toList(),
    };

    await _sendRequest('/v1/Account/Executors', data);
  }
}