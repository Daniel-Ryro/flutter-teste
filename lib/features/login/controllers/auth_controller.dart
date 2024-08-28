import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/utils/constants.dart';
import '../../main/presentation/main_screen.dart';
import '../presentation/webview.dart';
import '../domain/usecases/login_use_case.dart';
import '../domain/usecases/sign_up_use_case.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final FlutterSecureStorage secureStorage =
      FlutterSecureStorage(); // Armazenamento seguro para tokens
  final FlutterAppAuth _appAuth = FlutterAppAuth();

  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  String _nonce = '';

  AuthController({
    required this.loginUseCase,
    required this.signUpUseCase,
  });

  // Método para gerar o code verifier e code challenge
  String _generateCodeVerifier() {
    final Random random = Random.secure();
    final List<int> codeVerifier =
        List<int>.generate(32, (index) => random.nextInt(256));
    return base64UrlEncode(codeVerifier).replaceAll('=', '');
  }

  String _generateCodeChallenge(String codeVerifier) {
    final bytes = utf8.encode(codeVerifier);
    final digest = sha256.convert(bytes);
    return base64UrlEncode(digest.bytes).replaceAll('=', '');
  }

  String _generateNonce() {
    final Random random = Random.secure();
    final List<int> nonce =
        List<int>.generate(32, (index) => random.nextInt(256));
    return base64UrlEncode(nonce).replaceAll('=', '');
  }

  // Método para realizar o login do usuário utilizando uma WebView
  void login() async {
    isLoading.value = true;

    final codeVerifier = _generateCodeVerifier();
    final codeChallenge = _generateCodeChallenge(codeVerifier);
    _nonce = _generateNonce();

    try {
      final loginUrl = Uri(
        scheme: 'https',
        host: 'guardadigitalb2c.b2clogin.com',
        path: '/guardadigitalb2c.onmicrosoft.com/oauth2/v2.0/authorize',
        queryParameters: {
          'p': ApiConstants.policyName,
          'client_id': ApiConstants.clientId,
          'nonce': _nonce,
          'redirect_uri': ApiConstants.redirectUri,
          'scope': ApiConstants.scopes.join(' '),
          'response_type': 'code',
          'code_challenge': codeChallenge,
          'code_challenge_method': 'S256',
          'prompt': 'login',
        },
      ).toString();

      // Abra a WebView para login
      Get.to(() => WebViewScreen(
            url: loginUrl,
            onPageFinished: (url) async {
              Uri uri = Uri.parse(url);

              // Verifica se a URL contém o código de autorização
              if (uri.queryParameters.containsKey('code')) {
                String? code = uri.queryParameters['code'];

                if (code != null) {
                  try {
                    final TokenResponse? tokenResponse =
                        await _appAuth.token(TokenRequest(
                      ApiConstants.clientId,
                      ApiConstants.redirectUri,
                      authorizationCode: code,
                      codeVerifier:
                          codeVerifier, // Inclui o code_verifier na troca de código
                      nonce: _nonce,
                      discoveryUrl:
                          '${ApiConstants.issuer}/.well-known/openid-configuration',
                      scopes: ApiConstants.scopes,
                    ));

                    if (tokenResponse != null) {
                      // Salva os tokens
                      await secureStorage.write(
                          key: 'idToken', value: tokenResponse.idToken);
                      await secureStorage.write(
                          key: 'accessToken', value: tokenResponse.accessToken);
                      await secureStorage.write(
                          key: 'refreshToken',
                          value: tokenResponse.refreshToken);

                      // Navega para a tela principal
                      Get.offAll(() => const MainScreen());
                    } else {
                      print('Erro ao trocar o código pelo token.');
                    }
                  } catch (e) {
                    print('Erro ao trocar o código pelo token: $e');
                  }
                } else {
                  print('Erro: Código de autorização não encontrado.');
                }
              } else {
                print('Erro: A URL não contém o código de autorização.');
              }
            },
          ));
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
      // Utiliza o signUpUseCase para realizar o cadastro
      final user = await signUpUseCase();
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
