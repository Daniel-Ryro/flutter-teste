// lib/features/account/presentation/controllers/account_controller.dart
import 'package:get/get.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_account_data.dart';

class AccountController extends GetxController {
  final GetAccountData getAccountData;
  var user = Rxn<User>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  AccountController({required this.getAccountData});

  void loadAccountData() async {
    isLoading.value = true;
    final result = await getAccountData(const NoParams());
    result.fold(
      (failure) {
        errorMessage.value = "Erro ao carregar dados";
      },
      (userData) {
        user.value = userData;
      },
    );
    isLoading.value = false;
  }
}
