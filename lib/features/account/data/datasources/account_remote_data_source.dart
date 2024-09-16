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
  Future<List<BeneficiaryModel>> getBeneficiaries();
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  final Dio dio;
  final FlutterSecureStorage secureStorage;

  AccountRemoteDataSourceImpl({
    required this.dio,
    required this.secureStorage,
  }) {
    dio.options.baseUrl = 'https://api.guardadigital.com.br';
  }

  // Método auxiliar para obter o token de acesso
  Future<String> _getAccessToken() async {
    final accessToken = await secureStorage.read(key: 'accessToken');
    if (accessToken == null) {
      throw Exception("Token não encontrado.");
    }
    return accessToken;
  }

  // Método auxiliar para preparar as opções de requisição
  Future<Options> _getRequestOptions() async {
    final accessToken = await _getAccessToken();
    return Options(
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
      },
      validateStatus: (status) => status != null && status < 500,
    );
  }

  // Método auxiliar para lidar com respostas da API
  void _handleResponse(Response response, {String? errorMessage}) {
    if (response.statusCode == 401) {
      throw Exception("Erro de autenticação: Token inválido ou expirado.");
    } else if (response.statusCode != 200) {
      throw Exception(
          errorMessage ?? "Erro na requisição: Código ${response.statusCode}");
    }
  }

  @override
  Future<UserModel> getAccountData() async {
    try {
      final response = await dio.get(
        '/v1/Account',
        options: await _getRequestOptions(),
      );
      _handleResponse(response, errorMessage: "Erro ao buscar dados da conta");
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: ${e.toString()}");
    }
  }

  @override
  Future<List<ExecutorModel>> getExecutors() async {
    try {
      final response = await dio.get(
        '/v1/Account/Executors',
        options: await _getRequestOptions(),
      );
      _handleResponse(response, errorMessage: "Erro ao buscar dados dos executores");

      return (response.data as List<dynamic>)
          .map((executor) => ExecutorModel.fromJson(executor))
          .toList();
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: ${e.toString()}");
    }
  }

  @override
  Future<List<BeneficiaryModel>> getBeneficiaries() async {
    try {
      final response = await dio.get(
        '/v1/Account/Beneficiaries',
        options: await _getRequestOptions(),
      );
      _handleResponse(response, errorMessage: "Erro ao buscar dados dos beneficiários");

      return (response.data as List<dynamic>)
          .map((beneficiary) => BeneficiaryModel.fromJson(beneficiary))
          .toList();
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    } catch (e) {
      throw Exception("Erro inesperado: ${e.toString()}");
    }
  }

  Future<void> sendRequest(String url, Map<String, dynamic> data) async {
    try {
      final response = await dio.patch(
        url,
        data: data,
        options: await _getRequestOptions(),
      );

      _handleResponse(response, errorMessage: "Erro ao salvar dados");
    } on DioException catch (e) {
      throw Exception("Erro ao se comunicar com o servidor: ${e.message}");
    }
  }

  @override
  Future<void> updateExecutor(Executor executor) async {
    await sendRequest('/v1/Account/Executors', executor.toJson());
  }

  @override
  Future<void> addExecutor(Executor executor) async {
    List<ExecutorModel> executors = await getExecutors();
    executors.add(executor as ExecutorModel);

    final data = {
      "executors": executors.map((executor) => executor.toJson()).toList(),
    };

    await sendRequest('/v1/Account/Executors', data);
  }

  @override
  Future<void> saveBeneficiary(Beneficiary beneficiary) async {
    await sendRequest('/v1/Account/Beneficiaries', beneficiary.toJson());
  }
}
