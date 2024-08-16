import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/account/domain/entities/user.dart';
import '../../main/presentation/main_screen.dart';
import '../domain/usecases/login_use_case.dart';
import '../domain/usecases/sign_up_use_case.dart';

// Controlador responsável por gerenciar a lógica de autenticação
class AuthController extends GetxController {
  final LoginUseCase loginUseCase; // Use case para realizar login
  final SignUpUseCase signUpUseCase; // Use case para realizar o cadastro

  // Observáveis para armazenar os dados de entrada e estado de carregamento
  var email = ''.obs; // Observável para o e-mail do usuário
  var password = ''.obs; // Observável para a senha do usuário
  var isLoading = false.obs; // Observável para indicar o estado de carregamento

  // Construtor que recebe os use cases como dependências
  AuthController({
    required this.loginUseCase,
    required this.signUpUseCase,
  });

  // Método para realizar o login do usuário
  void login() async {
    isLoading.value = true; // Inicia o carregamento
    try {
      final User user = await loginUseCase(); // Executa o use case de login
      print('Login realizado com sucesso:');
      print('ID Token: ${user.idToken}');
      print('Access Token: ${user.accessToken}');
      print('Refresh Token: ${user.refreshToken}');
      
      // Redireciona o usuário para a tela principal após o login
      Get.offAll(() => MainScreen()); // Navega para a MainScreen e remove todas as rotas anteriores da pilha
    } catch (e) {
      print('Erro ao fazer login: $e'); // Imprime uma mensagem de erro em caso de falha
      // Trate o erro de autenticação (ex.: exibir mensagem de erro ao usuário)
    } finally {
      isLoading.value = false; // Finaliza o carregamento
    }
  }

  // Método para realizar o cadastro de um novo usuário
  void signUp() async {
    isLoading.value = true; // Inicia o carregamento
    try {
      final User user = await signUpUseCase(); // Executa o use case de cadastro
      print('Conta criada com sucesso:');
      print('ID Token: ${user.idToken}');
      print('Access Token: ${user.accessToken}');
      print('Refresh Token: ${user.refreshToken}');
      
      // Aqui você pode navegar para outra tela ou manipular o resultado da criação de conta
      Get.offAll(() => MainScreen()); // Opcionalmente, redireciona para a MainScreen após o cadastro
    } catch (e) {
      print('Erro ao criar conta: $e'); // Imprime uma mensagem de erro em caso de falha
      // Trate o erro de criação de conta (ex.: exibir mensagem de erro ao usuário)
    } finally {
      isLoading.value = false; // Finaliza o carregamento
    }
  }
}
