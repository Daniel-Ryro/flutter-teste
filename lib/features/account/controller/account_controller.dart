import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../domain/entities/user.dart';
import '../domain/usecases/get_account_data.dart';


class AccountController extends GetxController {
  final GetAccountData getAccountDataUseCase;

  AccountController({required this.getAccountDataUseCase});

  // Observables
  var user = Rxn<User>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAccountData();
  }

  // Função para buscar os dados do usuário
  void fetchAccountData() async {
    isLoading.value = true;
    errorMessage.value = '';

    final Either<Failure, User> result = await getAccountDataUseCase.call(const NoParams());

    result.fold(
      (failure) {
        errorMessage.value = "Erro ao carregar os dados da conta: ${failure.message}";
      },
      (userData) {
        user.value = userData;
      },
    );

    isLoading.value = false;
  }
}
