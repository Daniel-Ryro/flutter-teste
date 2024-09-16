import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/usecases/usecase.dart';
import '../data/datasources/account_remote_data_source.dart';
import '../data/models/beneficiary_model.dart';
import '../data/models/user_model.dart';
import '../data/models/executor_model.dart';
import '../domain/usecases/add_executor.dart';
import '../domain/usecases/get_account_data.dart';
import '../domain/usecases/get_beneficiaries.dart';
import '../domain/usecases/get_executors.dart';

class AccountController extends GetxController {
  final GetAccountData getAccountDataUseCase;
  final GetExecutors getExecutorsUseCase;
  final AddExecutor addExecutorUseCase;
  final GetBeneficiaries getBeneficiariesUseCase;

  // Variáveis reativas
  final user = Rxn<UserModel>();
  final executors = <ExecutorModel>[].obs;
  final beneficiaries = <BeneficiaryModel>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final maritalStatus = ''.obs;
  final address = ''.obs;

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  AccountController(
    this.getAccountDataUseCase,
    this.getExecutorsUseCase,
    this.addExecutorUseCase,
    this.getBeneficiariesUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    _initializeData();
  }

  void _initializeData() {
    fetchAccountData();
    fetchExecutors();
    fetchBeneficiaries();
    _loadMaritalStatus();
    _loadAddress();
  }

  Future<void> fetchAccountData() async {
    await _executeWithLoadingState(() async {
      final result = await getAccountDataUseCase.call(const NoParams());
      result.fold(
        (failure) => _handleError("Erro ao carregar os dados da conta", failure),
        (userData) => user.value = userData as UserModel,
      );
    });
  }

  Future<void> fetchExecutors() async {
    await _executeWithLoadingState(() async {
      final result = await getExecutorsUseCase.call(const NoParams());
      result.fold(
        (failure) => _handleError("Erro ao carregar os executores", failure, clearList: executors),
        (executorsData) => executors.assignAll(executorsData.cast<ExecutorModel>()),
      );
    });
  }

  Future<void> fetchBeneficiaries() async {
    await _executeWithLoadingState(() async {
      final result = await getBeneficiariesUseCase.call(const NoParams());
      result.fold(
        (failure) => _handleError("Erro ao carregar os beneficiários", failure, clearList: beneficiaries),
        (beneficiariesData) => beneficiaries.assignAll(beneficiariesData.cast<BeneficiaryModel>()),
      );
    });
  }

  Future<void> addOrUpdateExecutor(ExecutorModel executor) async {
    await _executeWithLoadingState(() async {
      final existingIndex = executors.indexWhere((e) => e.personId == executor.personId);
      if (existingIndex != -1) {
        executors[existingIndex] = executor;
        await _sendUpdatedExecutorsToApi();
      } else {
        final result = await addExecutorUseCase.call(executor);
        result.fold(
          (failure) => _handleError("Erro ao adicionar o executor", failure),
          (_) => fetchExecutors(),
        );
      }
    });
  }

  Future<void> addOrUpdateBeneficiary(BeneficiaryModel beneficiary) async {
    await _executeWithLoadingState(() async {
      final existingIndex = beneficiaries.indexWhere((b) => b.personId == beneficiary.personId);
      if (existingIndex != -1) {
        beneficiaries[existingIndex] = beneficiary;
        await _sendUpdatedBeneficiariesToApi();
      } else {
        beneficiaries.add(beneficiary);
        await _sendUpdatedBeneficiariesToApi();
      }
    });
  }

  Future<void> removeExecutor(String personId) async {
    await _executeWithLoadingState(() async {
      executors.removeWhere((executor) => executor.personId.toString() == personId);
      await _sendUpdatedExecutorsToApi();
    });
  }

  Future<void> removeBeneficiary(String personId) async {
    await _executeWithLoadingState(() async {
      beneficiaries.removeWhere((beneficiary) => beneficiary.personId.toString() == personId);
      await _sendUpdatedBeneficiariesToApi();
    });
  }

  Future<void> _sendUpdatedExecutorsToApi() async {
    await _sendDataToApi(
      endpoint: '/v1/Account/Executors',
      data: {"executors": executors.map((executor) => executor.toJson()).toList()},
      onSuccess: fetchExecutors,
    );
  }

  Future<void> _sendUpdatedBeneficiariesToApi() async {
    await _sendDataToApi(
      endpoint: '/v1/Account/Beneficiaries',
      data: {
        "command": "update",
        "beneficiaries": beneficiaries.map((beneficiary) {
          return beneficiary.toJson()
            ..["statusExecutor"] = int.tryParse(beneficiary.statusExecutor.toString()) ?? 0;
        }).toList(),
      },
      onSuccess: fetchBeneficiaries,
    );
  }

  Future<void> _sendDataToApi({
    required String endpoint,
    required Map<String, dynamic> data,
    required Future<void> Function() onSuccess,
  }) async {
    try {
      await AccountRemoteDataSourceImpl(
        dio: Dio(),
        secureStorage: secureStorage,
      ).sendRequest(endpoint, data);
      await onSuccess();
    } catch (e) {
      _handleError("Erro ao enviar dados para o servidor", e);
    }
  }

  Future<void> _executeWithLoadingState(Future<void> Function() action) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await action();
    } finally {
      isLoading.value = false;
    }
  }

  void _handleError(String message, dynamic error, {RxList<dynamic>? clearList}) {
    errorMessage.value = "$message: ${error.toString()}";
    clearList?.clear();
    print(errorMessage.value);
  }

  Future<void> _loadMaritalStatus() async {
    maritalStatus.value = await _loadFromStorage('maritalStatus', defaultValue: 'Solteiro');
  }

  Future<void> _loadAddress() async {
    address.value = await _loadFromStorage('address', defaultValue: '');
  }

  Future<String> _loadFromStorage(String key, {required String defaultValue}) async {
    try {
      final value = await secureStorage.read(key: key);
      return value ?? defaultValue;
    } catch (e) {
      print('Erro ao carregar $key: $e');
      return defaultValue;
    }
  }

  Future<void> _saveToStorage(String key, String value) async {
    try {
      await secureStorage.write(key: key, value: value);
      print('$key salvo: $value');
    } catch (e) {
      print('Erro ao salvar $key: $e');
    }
  }

  Future<void> updateMaritalStatus(String status) async {
    maritalStatus.value = status;
    await _saveToStorage('maritalStatus', status);
  }

  Future<void> updateAddress(String newAddress) async {
    address.value = newAddress;
    await _saveToStorage('address', newAddress);
  }
}
