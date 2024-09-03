import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/utils/constants.dart';
import '../../presentation/landing_screen.dart';
import '../models/user_model.dart';

// Definição da interface para o data source remoto de autenticação
abstract class AuthRemoteDataSource {
  Future<UserModel> login(); // Método para realizar o login
  Future<UserModel> signUp(); // Método para realizar o cadastro
  Future<void> logout(String idToken); // Método para realizar o logout
}

// Implementação concreta do AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FlutterAppAuth
      _appAuth; // Dependência para manipular o fluxo de autenticação usando OAuth 2.0

  // Construtor que recebe a instância do FlutterAppAuth e a armazena como variável privada
  AuthRemoteDataSourceImpl({
    required FlutterAppAuth appAuth,
  }) : _appAuth = appAuth;

  // Método para realizar o login do usuário
  @override
  Future<UserModel> login() async {
    final AuthorizationTokenRequest request = AuthorizationTokenRequest(
      ApiConstants.clientId,
      ApiConstants.redirectUri,
      issuer: ApiConstants.issuer,
      scopes: ApiConstants.scopes,
      promptValues: ['login'], // Garante que sempre exiba a tela de login
      allowInsecureConnections:
          false, // Certifica-se de que as conexões são seguras
    );

    try {
      final AuthorizationTokenResponse? result =
          await _appAuth.authorizeAndExchangeCode(request);

      if (result != null) {
        return UserModel(
          idToken: result.idToken!, // Token de identidade (JWT)
          accessToken: result.accessToken!, // Token de acesso
          refreshToken: result.refreshToken!, // Token de atualização
        );
      } else {
        throw Exception('Login falhou: Nenhum resultado retornado.');
      }
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  // Método para realizar o cadastro do usuário
  @override
  Future<UserModel> signUp() async {
    return login(); // Reutiliza o método de login, conforme o fluxo de autenticação.
  }

  // Método para realizar o logout do usuário
  @override
  Future<void> logout(String idToken) async {
    try {
      final EndSessionRequest request = EndSessionRequest(
        idTokenHint: idToken,
        postLogoutRedirectUrl:
            ApiConstants.redirectUri, // Adicione o redirecionamento de logout
        issuer: ApiConstants.issuer,
      );

      await _appAuth.endSession(request);

      // Força a navegação de volta para a tela inicial após o logout
      Get.offAll(() => const LandingScreen());
    } on PlatformException catch (e) {
      if (e.code == 'end_session_failed' &&
          e.message != null &&
          e.message!.contains('User cancelled flow')) {
        print('Logout cancelado pelo usuário.');
      } else {
        throw Exception('Erro ao fazer logout: ${e.message}');
      }
    } catch (e) {
      throw Exception('Erro ao fazer logout: $e');
    }
  }

  Future<void> refreshToken(String refreshToken) async {
    try {
      final TokenResponse? result = await _appAuth.token(
        TokenRequest(
          ApiConstants.clientId,
          ApiConstants.redirectUri,
          refreshToken: refreshToken,
          discoveryUrl:
              '${ApiConstants.issuer}/.well-known/openid-configuration',
          scopes: ApiConstants.scopes,
        ),
      );

      if (result != null) {
        // Atualize o armazenamento seguro com os novos tokens
        const FlutterSecureStorage secureStorage = FlutterSecureStorage();
        await secureStorage.write(key: 'idToken', value: result.idToken);
        await secureStorage.write(
            key: 'accessToken', value: result.accessToken);
        await secureStorage.write(
            key: 'refreshToken', value: result.refreshToken);
        print('Token atualizado com sucesso.');
      } else {
        print('Erro ao atualizar o token.');
      }
    } catch (e) {
      print('Erro ao atualizar o token: $e');
    }
  }
}
