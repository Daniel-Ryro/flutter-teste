import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/login/domain/entities/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../main/presentation/main_screen.dart';
import '../domain/usecases/login_use_case.dart';
import '../domain/usecases/sign_up_use_case.dart';
import '../presentation/webview.dart';
import '../presentation/welcome_screen.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final FlutterSecureStorage secureStorage =
      FlutterSecureStorage(); // Armazenamento seguro para tokens

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;

  AuthController({
    required this.loginUseCase,
    required this.signUpUseCase,
  });

  // Método para realizar o login do usuário, agora abre uma WebView
  void login() async {
    isLoading.value = true;
    try {
      // Abra a WebView para login
      Get.to(() => WebViewScreen(
          url:
              'https://guardadigitalb2c.b2clogin.com/guardadigitalb2c.onmicrosoft.com/oauth2/v2.0/authorize?p=B2C_1_susi&client_id=6f93a629-c8b4-4407-9881-a69f1db2d03a&nonce=defaultNonce&redirect_uri=br.com.guardadigital.authapp%3A%2F%2Foauthredirect&scope=openid%20https%3A%2F%2Fguardadigitalb2c.onmicrosoft.com%2Fapi%2Fplan%20https%3A%2F%2Fguardadigitalb2c.onmicrosoft.com%2Fapi%2Fsubscription%20https%3A%2F%2Fguardadigitalb2c.onmicrosoft.com%2Fapi%2Fstorage%20https%3A%2F%2Fguardadigitalb2c.onmicrosoft.com%2Fapi%2Fpartner%20https%3A%2F%2Fguardadigitalb2c.onmicrosoft.com%2Fapi%2Faccount&response_type=code&prompt=login',
          onPageFinished: (url) async {
            Uri uri = Uri.parse(url);
            String? idToken = uri.queryParameters['id_token'];
            String? accessToken = uri.queryParameters['access_token'];
            String? refreshToken = uri.queryParameters['refresh_token'];

            if (idToken != null &&
                accessToken != null &&
                refreshToken != null) {
              // Salva os tokens
              await secureStorage.write(key: 'idToken', value: idToken);
              await secureStorage.write(key: 'accessToken', value: accessToken);
              await secureStorage.write(
                  key: 'refreshToken', value: refreshToken);

              // Navega para a tela principal
              Get.offAll(() => WelcomeScreen());
            } else {
              // Trate o caso em que os tokens não foram capturados
              print('Erro: Tokens não foram encontrados na URL.');
            }
          }));
    } catch (e) {
      print('Erro ao abrir a página de login: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Método para realizar o cadastro de um novo usuário
  void signUp() async {
    isLoading.value = true;
    try {
      final User user = await signUpUseCase();
      print('Conta criada com sucesso:');
      print('ID Token: ${user.idToken}');
      print('Access Token: ${user.accessToken}');
      print('Refresh Token: ${user.refreshToken}');

      Get.offAll(() => MainScreen());
    } catch (e) {
      print('Erro ao criar conta: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
