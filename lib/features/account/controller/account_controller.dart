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
  var user = Rxn<UserModel>();
  var executors = <ExecutorModel>[].obs;
  var beneficiaries = <BeneficiaryModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var maritalStatus = ''.obs;
  var address = ''.obs;

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
    fetchAccountData();
    fetchExecutors();
    fetchBeneficiaries(); // Chama o método para buscar os beneficiários ao iniciar
    loadMaritalStatus();
    loadAddress();
  }

  // Função para buscar os dados do usuário
  void fetchAccountData() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await getAccountDataUseCase.call(const NoParams());

    result.fold(
      (failure) {
        errorMessage.value =
            "Erro ao carregar os dados da conta: ${failure.message}";
        user.value = null;
      },
      (userData) {
        user.value = userData as UserModel;
      },
    );

    isLoading.value = false;
  }

  // Função para buscar a lista de executores
  void fetchExecutors() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await getExecutorsUseCase.call(const NoParams());

    result.fold(
      (failure) {
        errorMessage.value =
            "Erro ao carregar os executores: ${failure.message}";
        executors.clear(); // Limpa a lista de executores em caso de erro
      },
      (executorsData) {
        executors.value = executorsData.cast<ExecutorModel>();
      },
    );

    isLoading.value = false;
  }

  // Função para buscar a lista de beneficiários
  void fetchBeneficiaries() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await getBeneficiariesUseCase.call(const NoParams());

    result.fold(
      (failure) {
        errorMessage.value =
            "Erro ao carregar os beneficiários: ${failure.message}";
        beneficiaries.clear(); // Limpa a lista de beneficiários em caso de erro
      },
      (beneficiariesData) {
        beneficiaries.value = beneficiariesData.cast<BeneficiaryModel>();
      },
    );

    isLoading.value = false;
  }

  // Método para adicionar ou atualizar um executor
  Future<void> addOrUpdateExecutor(ExecutorModel executor) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      int existingIndex =
          executors.indexWhere((e) => e.personId == executor.personId);

      if (existingIndex != -1) {
        executors[existingIndex] = executor;
        print('Executor atualizado localmente na lista.');
        await _sendUpdatedExecutorsToApi();
      } else {
        final result = await addExecutorUseCase.call(executor);

        result.fold(
          (failure) {
            errorMessage.value =
                "Erro ao adicionar o executor: ${failure.message}";
          },
          (_) {
            fetchExecutors();
          },
        );
      }
    } catch (e) {
      print('Erro ao adicionar ou atualizar executor: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Método para enviar a lista atualizada de executores para a API
  Future<void> _sendUpdatedExecutorsToApi() async {
    final data = {
      "executors": executors.map((executor) => executor.toJson()).toList(),
    };

    try {
      print("Enviando dados atualizados: $data");
      await AccountRemoteDataSourceImpl(
        dio: Dio(),
        secureStorage: secureStorage,
      ).sendRequest('/v1/Account/Executors', data);

      List<ExecutorModel> updatedExecutors =
          await getExecutorsUseCase.call(const NoParams()).then((result) {
        return result.fold(
          (l) => <ExecutorModel>[],
          (r) => r.map((executor) => executor as ExecutorModel).toList(),
        );
      });

      executors.value = updatedExecutors;
      print("Executores atualizados após PATCH: $updatedExecutors");
    } catch (e) {
      print('Erro ao enviar a lista atualizada de executores: $e');
    }
  }

  // Método para adicionar ou atualizar um beneficiário
  Future<void> addOrUpdateBeneficiary(BeneficiaryModel beneficiary) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      int existingIndex =
          beneficiaries.indexWhere((b) => b.personId == beneficiary.personId);

      if (existingIndex != -1) {
        beneficiaries[existingIndex] = beneficiary;
        print('Beneficiário atualizado localmente na lista.');
        await _sendUpdatedBeneficiariesToApi();
      } else {
        beneficiaries.add(beneficiary);
        await _sendUpdatedBeneficiariesToApi();
        print('Beneficiário adicionado e lista atualizada.');
      }
    } catch (e) {
      print('Erro ao adicionar ou atualizar beneficiário: $e');
      errorMessage.value = "Erro ao adicionar ou atualizar beneficiário: $e";
    } finally {
      isLoading.value = false;
    }
  }

// Método para enviar a lista atualizada de beneficiários para a API
  Future<void> _sendUpdatedBeneficiariesToApi() async {
    final data = {
      "command": "update", // Adicione o campo de comando necessário aqui
      "beneficiaries": beneficiaries.map((beneficiary) {
        return beneficiary.toJson()
          ..["statusExecutor"] =
              int.tryParse(beneficiary.statusExecutor.toString()) ??
                  0; // Certifica que statusExecutor é um inteiro
      }).toList(),
    };

    try {
      print("Enviando dados atualizados de beneficiários: $data");
      await AccountRemoteDataSourceImpl(
        dio: Dio(),
        secureStorage: secureStorage,
      ).sendRequest('/v1/Account/Beneficiaries', data);

      // Verifica se a atualização foi bem-sucedida
      List<BeneficiaryModel> updatedBeneficiaries =
          await getBeneficiariesUseCase.call(const NoParams()).then((result) {
        return result.fold(
          (l) => <BeneficiaryModel>[],
          (r) =>
              r.map((beneficiary) => beneficiary as BeneficiaryModel).toList(),
        );
      });

      beneficiaries.value = updatedBeneficiaries;
      print("Beneficiários atualizados após PATCH: $updatedBeneficiaries");
    } catch (e) {
      print('Erro ao enviar a lista atualizada de beneficiários: $e');
      errorMessage.value =
          "Erro ao enviar a lista atualizada de beneficiários: $e";
    }
  }

  // Funções para salvar e carregar estado civil e endereço
  Future<void> saveMaritalStatus(String status) async {
    try {
      await secureStorage.write(key: 'maritalStatus', value: status);
      print('Estado civil salvo: $status');
    } catch (e) {
      print('Erro ao salvar o estado civil: $e');
    }
  }

  Future<void> loadMaritalStatus() async {
    try {
      String? savedStatus = await secureStorage.read(key: 'maritalStatus');
      if (savedStatus != null) {
        maritalStatus.value = savedStatus;
        print('Estado civil carregado: $savedStatus');
      } else {
        maritalStatus.value = 'Solteiro';
        print('Nenhum estado civil salvo encontrado, usando padrão: Solteiro');
      }
    } catch (e) {
      print('Erro ao carregar o estado civil: $e');
    }
  }

  Future<void> saveAddress(String newAddress) async {
    try {
      address.value = newAddress;
      await secureStorage.write(key: 'address', value: newAddress);
      print('Endereço salvo: $newAddress');
    } catch (e) {
      print('Erro ao salvar o endereço: $e');
    }
  }

  Future<void> loadAddress() async {
    try {
      String? savedAddress = await secureStorage.read(key: 'address');
      if (savedAddress != null) {
        address.value = savedAddress;
        print('Endereço carregado: $savedAddress');
      }
    } catch (e) {
      print('Erro ao carregar o endereço: $e');
    }
  }

  Future<void> updateMaritalStatus(String status) async {
    maritalStatus.value = status;
    await saveMaritalStatus(status);
  }

  Future<void> updateAddress(String newAddress) async {
    address.value = newAddress;
    await saveAddress(newAddress);
  }

  // Método para remover um executor pelo personId
  Future<void> removeExecutor(String personId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      executors
          .removeWhere((executor) => executor.personId.toString() == personId);
      print('Executor removido localmente. Atualizando no servidor...');

      await _sendUpdatedExecutorsToApi();
    } catch (e) {
      errorMessage.value = "Erro ao remover o executor: $e";
    } finally {
      isLoading.value = false;
    }
  }

  // Método para remover um beneficiário pelo personId
  Future<void> removeBeneficiary(String personId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Remove o beneficiário localmente da lista com base no personId
      beneficiaries.removeWhere(
          (beneficiary) => beneficiary.personId.toString() == personId);
      print('Beneficiário removido localmente. Atualizando no servidor...');

      // Envia a lista atualizada de beneficiários para a API
      await _sendUpdatedBeneficiariesToApi();
    } catch (e) {
      errorMessage.value = "Erro ao remover o beneficiário: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
