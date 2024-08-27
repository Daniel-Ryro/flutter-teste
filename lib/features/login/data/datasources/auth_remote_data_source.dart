import 'package:flutter_appauth/flutter_appauth.dart';
import '../../../../core/utils/constants.dart';
import '../models/user_model.dart';

// Definição da interface para o data source remoto de autenticação
abstract class AuthRemoteDataSource {
  Future<UserModel> login(); // Método para realizar o login
  Future<UserModel> signUp(); // Método para realizar o cadastro
  Future<void> logout(String idToken); // Método para realizar o logout
}

// Implementação concreta do AuthRemoteDataSource
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FlutterAppAuth _appAuth; // Dependência para manipular o fluxo de autenticação usando OAuth 2.0

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
      allowInsecureConnections: false, // Certifica-se de que as conexões são seguras
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
        idTokenHint: idToken, // Token de ID do usuário para encerrar a sessão
        postLogoutRedirectUrl: ApiConstants.redirectUri,
        issuer: ApiConstants.issuer, // O issuer já contém o tenantId, não sendo necessário concatená-lo
      );

      await _appAuth.endSession(request);
    } catch (e) {
      throw Exception('Erro ao fazer logout: $e');
    }
  }
}
