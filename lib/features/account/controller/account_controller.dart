import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/usecases/usecase.dart';
import '../data/datasources/account_remote_data_source.dart';
import '../data/models/user_model.dart';
import '../data/models/executor_model.dart';
import '../domain/usecases/add_executor.dart';
import '../domain/usecases/get_account_data.dart';
import '../domain/usecases/get_executors.dart';

class AccountController extends GetxController {
  final GetAccountData getAccountDataUseCase;
  final GetExecutors getExecutorsUseCase;
  final AddExecutor addExecutorUseCase;

  // Variáveis reativas
  var user = Rxn<UserModel>();
  var executors = <ExecutorModel>[].obs; // Lista de executores
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var maritalStatus = ''.obs;
  var address = ''.obs;

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  AccountController(
    this.getAccountDataUseCase,
    this.getExecutorsUseCase,
    this.addExecutorUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    fetchAccountData();
    fetchExecutors(); // Chama o método para buscar os executores ao iniciar
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
        executors.value = executorsData
            .cast<ExecutorModel>(); // Atribui a lista de executores recuperada
      },
    );

    isLoading.value = false;
  }

  // Método para adicionar ou atualizar um executor
  Future<void> addOrUpdateExecutor(ExecutorModel executor) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Verifica se o executor já existe com base no personId
      int existingIndex =
          executors.indexWhere((e) => e.personId == executor.personId);

      if (existingIndex != -1) {
        // Se o executor já existe, atualize-o
        executors[existingIndex] = executor;
        print('Executor atualizado localmente na lista.');

        // Envie a lista atualizada para a API
        await _sendUpdatedExecutorsToApi();
      } else {
        // Se o executor não existe, adicione-o
        final result = await addExecutorUseCase.call(executor);

        result.fold(
          (failure) {
            errorMessage.value =
                "Erro ao adicionar o executor: ${failure.message}";
          },
          (_) {
            fetchExecutors(); // Atualiza a lista de executores após a adição
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
              dio: Dio(), secureStorage: secureStorage)
          .sendRequest('/v1/Account/Executors', data);

      // Verifica se a atualização foi bem-sucedida
      List<ExecutorModel> updatedExecutors =
          await getExecutorsUseCase.call(const NoParams()).then((result) {
        return result.fold(
          (l) =>
              <ExecutorModel>[], // Retorna uma lista vazia de ExecutorModel em caso de erro
          (r) => r
              .map((executor) => executor as ExecutorModel)
              .toList(), // Converte cada Executor para ExecutorModel
        );
      });

      executors.value = updatedExecutors;
      print("Executores atualizados após PATCH: $updatedExecutors");
    } catch (e) {
      print('Erro ao enviar a lista atualizada de executores: $e');
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

   // Método para remover um executor pelo personId
  Future<void> removeExecutor(String personId) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      // Filtra a lista para remover o executor com o personId correspondente
      executors.removeWhere((executor) => executor.personId.toString() == personId);
      print('Executor removido localmente. Atualizando no servidor...');

      // Envia a lista atualizada para o servidor
      await _sendUpdatedExecutorsToApi();
    } catch (e) {
      errorMessage.value = "Erro ao remover o executor: $e";
    } finally {
      isLoading.value = false;
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
}
