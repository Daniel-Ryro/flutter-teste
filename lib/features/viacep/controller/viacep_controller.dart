import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../data/models/cep_model.dart';
import '../domain/usecases/get_cep_data.dart';

class ViaCepController extends GetxController {
  final GetCepData getCepDataUseCase;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var cepModel = Rxn<CepModel>();
  var buttonText = 'CONTINUE'.obs; // Propriedade buttonText como RxString

  ViaCepController(this.getCepDataUseCase);

  @override
  void onInit() {
    super.onInit();
    _loadSavedAddress(); // Carregar o endereço salvo ao iniciar o controlador
  }

  Future<void> fetchCepData(String cep) async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await getCepDataUseCase.call(cep);

    cepModel.value = result;
    _saveAddress(result); // Salvar o endereço quando a busca é bem-sucedida

    isLoading.value = false;
  }

  // Método para redefinir o estado do controlador
  void resetState() {
    errorMessage.value = '';
    cepModel.value = null;
    buttonText.value = 'CONTINUE';
  }

  Future<void> _saveAddress(CepModel data) async {
    String addressJson = jsonEncode(data.toJson());
    await _secureStorage.write(key: 'address', value: addressJson);
  }

  Future<void> _loadSavedAddress() async {
    String? savedAddress = await _secureStorage.read(key: 'address');
    if (savedAddress != null) {
      // Converte a string JSON salva de volta para um Map<String, dynamic>
      Map<String, dynamic> addressMap = jsonDecode(savedAddress);
      // Cria a instância de CepModel usando o mapa decodificado
      cepModel.value = CepModel.fromJson(addressMap);
    }
  }
}
