import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/beneficiary.dart';
import '../../domain/entities/executor.dart';
import '../models/beneficiary_model.dart';
import '../models/user_model.dart';
import '../models/executor_model.dart';

abstract class AccountRemoteDataSource {
  Future<UserModel> getAccountData();
  Future<List<ExecutorModel>> getExecutors();
  Future<void> updateExecutor(Executor executor);
  Future<void> addExecutor(Executor executor);
  Future<void> saveBeneficiary(Beneficiary beneficiary);
  Future<void> sendRequest(String url, Map<String, dynamic> data);
  Future<List<BeneficiaryModel>> getBeneficiaries();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  AccountRemoteDataSourceImpl({
    required this.dio,
    required this.secureStorage,
  }) {
    // Definindo a URL base para todas as requisições
    dio.options.baseUrl =
        'https://api.guardadigital.com.br'; // Substitua pelo host da sua API
  }

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

  @override
  Future<void> sendRequest(String url, Map<String, dynamic> data) async {
    String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }

    try {
      print("Enviando requisição PATCH para: $url");
      print("Dados enviados: $data");

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
        print("Erro na resposta do servidor: ${response.data}");
        throw Exception(
            "Erro ao salvar dados: Código ${response.statusCode} - ${response.data}");
      }
    } on DioException catch (e) {
      print("Erro de comunicação com o servidor: ${e.message}");
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    }
  }

  @override
  Future<void> updateExecutor(Executor executor) async {
    final data = executor.toJson();
    await sendRequest('/v1/Account/Executors', data);
  }

  @override
  Future<void> addExecutor(Executor executor) async {
    List<ExecutorModel> executors = await getExecutors();

    executors.add(executor as ExecutorModel);

    final data = {
      "executors": executors.map((executor) => executor.toJson()).toList(),
    };

    print("Enviando dados: $data");

    await sendRequest('/v1/Account/Executors', data);

    List<ExecutorModel> updatedExecutors = await getExecutors();
    print("Executores atualizados após PATCH: $updatedExecutors");
  }

  @override
  Future<List<BeneficiaryModel>> getBeneficiaries() async {
    String? accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }

    try {
      final response = await dio.get(
        '/v1/Account/Beneficiaries',
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
        List<dynamic> beneficiariesJson = response.data as List<dynamic>;
        return beneficiariesJson
            .map((beneficiary) => BeneficiaryModel.fromJson(beneficiary))
            .toList();
      } else if (response.statusCode == 401) {
        throw Exception("Erro de autenticação: Token inválido ou expirado.");
      } else {
        throw Exception(
            "Erro ao buscar dados dos beneficiários: Código ${response.statusCode}");
      }
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: ${e.toString()}");
    }
  }

  @override
  Future<void> saveBeneficiary(Beneficiary beneficiary) async {
    final data = beneficiary.toJson();
    await sendRequest('/v1/Account/Beneficiaries', data);
  }
}
