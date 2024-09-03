import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../core/usecases/usecase.dart';
import '../data/models/user_model.dart';
import '../domain/usecases/get_account_data.dart';

class AccountController extends GetxController {
  final GetAccountData getAccountDataUseCase;

  // Variáveis reativas
  var user = Rxn<UserModel>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var maritalStatus = ''.obs; // Variável reativa para o estado civil
  var address = ''.obs; // Variável reativa para o endereço

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage(); // Armazenamento seguro

  AccountController(this.getAccountDataUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchAccountData();
    loadMaritalStatus(); // Carrega o estado civil ao iniciar
    loadAddress(); // Carrega o endereço ao iniciar
  }

  // Função para buscar os dados do usuário
  void fetchAccountData() async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await getAccountDataUseCase.call(const NoParams());

    result.fold(
      (failure) {
        errorMessage.value = "Erro ao carregar os dados da conta: ${failure.message}";
        user.value = null;
      },
      (userData) {
        user.value = userData as UserModel;
      },
    );

    isLoading.value = false;
  }

  // Função para salvar o estado civil
  Future<void> saveMaritalStatus(String status) async {
    try {
      await secureStorage.write(key: 'maritalStatus', value: status);
      print('Estado civil salvo: $status'); // Debugging print
    } catch (e) {
      print('Erro ao salvar o estado civil: $e'); // Debugging print
    }
  }

  // Função para carregar o estado civil
  Future<void> loadMaritalStatus() async {
    try {
      String? savedStatus = await secureStorage.read(key: 'maritalStatus');
      if (savedStatus != null) {
        maritalStatus.value = savedStatus;
        print('Estado civil carregado: $savedStatus'); // Debugging print
      } else {
        maritalStatus.value = 'Solteiro'; // Estado civil padrão se nada estiver salvo
        print('Nenhum estado civil salvo encontrado, usando padrão: Solteiro'); // Debugging print
      }
    } catch (e) {
      print('Erro ao carregar o estado civil: $e'); // Debugging print
    }
  }

  // Função para salvar o endereço
  Future<void> saveAddress(String newAddress) async {
    try {
      address.value = newAddress;
      await secureStorage.write(key: 'address', value: newAddress);
      print('Endereço salvo: $newAddress'); // Debugging print
    } catch (e) {
      print('Erro ao salvar o endereço: $e'); // Debugging print
    }
  }

  // Função para carregar o endereço
  Future<void> loadAddress() async {
    try {
      String? savedAddress = await secureStorage.read(key: 'address');
      if (savedAddress != null) {
        address.value = savedAddress;
        print('Endereço carregado: $savedAddress'); // Debugging print
      }
    } catch (e) {
      print('Erro ao carregar o endereço: $e'); // Debugging print
    }
  }

  // Método para atualizar o estado civil
  Future<void> updateMaritalStatus(String status) async {
    maritalStatus.value = status;
    await saveMaritalStatus(status); // Salva o estado civil no armazenamento seguro
  }

  // Método para atualizar o endereço
  Future<void> updateAddress(String newAddress) async {
    address.value = newAddress;
    await saveAddress(newAddress); // Salva o endereço atualizado no armazenamento seguro
  }
}
