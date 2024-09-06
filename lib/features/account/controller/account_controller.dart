import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/usecases/usecase.dart';
import '../data/models/user_model.dart';
import '../data/models/executor_model.dart';
import '../domain/usecases/add_executor.dart';
import '../domain/usecases/get_account_data.dart';
import '../domain/usecases/get_executors.dart';
import '../domain/usecases/get_update_executor.dart';

class AccountController extends GetxController {
  final GetAccountData getAccountDataUseCase;
  final GetExecutors getExecutorsUseCase;
  //final UpdateExecutor updateExecutorUseCase;
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
    //this.updateExecutorUseCase,
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

  // Função para salvar o estado civil
  Future<void> saveMaritalStatus(String status) async {
    try {
      await secureStorage.write(key: 'maritalStatus', value: status);
      print('Estado civil salvo: $status');
    } catch (e) {
      print('Erro ao salvar o estado civil: $e');
    }
  }

  // Função para carregar o estado civil
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

  // Função para salvar o endereço
  Future<void> saveAddress(String newAddress) async {
    try {
      address.value = newAddress;
      await secureStorage.write(key: 'address', value: newAddress);
      print('Endereço salvo: $newAddress');
    } catch (e) {
      print('Erro ao salvar o endereço: $e');
    }
  }

  // Função para carregar o endereço
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

  // Método para atualizar o estado civil
  Future<void> updateMaritalStatus(String status) async {
    maritalStatus.value = status;
    await saveMaritalStatus(status);
  }

  // Método para atualizar o endereço
  Future<void> updateAddress(String newAddress) async {
    address.value = newAddress;
    await saveAddress(newAddress);
  }

  // // Método para atualizar ou adicionar um executor
  // Future<void> updateExecutor(ExecutorModel executor) async {
  //   isLoading.value = true;
  //   errorMessage.value = '';

  //   final result = await updateExecutorUseCase.call(executor);

  //   result.fold(
  //     (failure) {
  //       errorMessage.value = "Erro ao atualizar o executor: ${failure.message}";
  //     },
  //     (_) {
  //       fetchExecutors(); // Atualiza a lista de executores após a adição ou atualização
  //     },
  //   );

  //   isLoading.value = false;
  // }

  // Método para adicionar um novo executor
  Future<void> addExecutor(ExecutorModel executor) async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await addExecutorUseCase.call(executor);

    result.fold(
      (failure) {
        errorMessage.value = "Erro ao adicionar o executor: ${failure.message}";
      },
      (_) {
        fetchExecutors(); // Atualiza a lista de executores após a adição
      },
    );

    isLoading.value = false;
  }
}
