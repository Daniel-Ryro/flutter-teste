import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/account/domain/entities/user.dart';
import '../data/models/user_model.dart';
import '../domain/usecases/login_use_case.dart';
import '../domain/usecases/sign_up_use_case.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  AuthController({
    required this.loginUseCase,
    required this.signUpUseCase,
  });

  void login() async {
    isLoading.value = true;
    try {
      final User user = await loginUseCase();
      print('Login realizado com sucesso:');
      print('ID Token: ${user.idToken}');
      print('Access Token: ${user.accessToken}');
      print('Refresh Token: ${user.refreshToken}');
      // Aqui você pode armazenar os tokens de forma segura se necessário
    } catch (e) {
      print('Erro ao fazer login: $e'); // Mensagem de erro
      // Trate o erro de autenticação
    } finally {
      isLoading.value = false;
    }
  }

  void signUp() async {
    isLoading.value = true;
    try {
      final User user = await signUpUseCase();
      print('Conta criada com sucesso:');
      print('ID Token: ${user.idToken}');
      print('Access Token: ${user.accessToken}');
      print('Refresh Token: ${user.refreshToken}');
      // Aqui você pode navegar para outra tela ou manipular o resultado da criação de conta
    } catch (e) {
      print('Erro ao criar conta: $e'); // Mensagem de erro
      // Trate o erro de criação de conta
    } finally {
      isLoading.value = false;
    }
  }
}
