import 'package:get/get.dart';
import '../data/models/cep_model.dart';
import '../domain/usecases/get_cep_data.dart';

class ViaCepController extends GetxController {
  final GetCepData getCepDataUseCase;

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var cepModel = Rxn<CepModel>();
  var buttonText = 'CONTINUE'.obs; // Propriedade buttonText como RxString

  ViaCepController(this.getCepDataUseCase);

  Future<void> fetchCepData(String cep) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Tenta buscar os dados do CEP
      final cepData = await getCepDataUseCase.call(cep);
      cepModel.value = cepData; // Atualiza o modelo com os dados obtidos

      buttonText.value = 'Editar Endereço'; // Atualiza o texto do botão após o sucesso
    } catch (e) {
      // Se houver um erro, captura a exceção e define a mensagem de erro
      errorMessage.value = 'Erro ao buscar o CEP: $e';
    } finally {
      isLoading.value = false; // Garante que o indicador de carregamento seja desligado
    }
  }
}
