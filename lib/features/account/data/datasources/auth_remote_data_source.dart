import 'package:flutter_appauth/flutter_appauth.dart';
import '../../../../core/utils/constants.dart';
import '../models/user_model.dart';

// Definição da interface para o data source remoto de autenticação
abstract class AuthRemoteDataSource {
  Future<UserModel> login();  // Método para realizar o login
  Future<UserModel> signUp(); // Método para realizar o cadastro
  Future<void> logout();      // Método para realizar o logout
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
    // Cria uma requisição de autorização e troca de token
    final AuthorizationTokenRequest request = AuthorizationTokenRequest(
      ApiConstants.clientId,          // ID do cliente para o OAuth
      ApiConstants.redirectUri,       // URI de redirecionamento configurada para o cliente
      issuer: ApiConstants.issuer,    // Emissor (Issuer) do OAuth
      scopes: ApiConstants.scopes,    // Escopos de autorização solicitados (ex.: profile, email)
    );

    try {
      // Tenta autorizar e trocar o código de autorização pelo token de acesso
      final AuthorizationTokenResponse? result =
          await _appAuth.authorizeAndExchangeCode(request);

      // Se a resposta for não nula, cria e retorna um UserModel com os tokens recebidos
      if (result != null) {
        return UserModel(
          idToken: result.idToken!,           // Token de identidade (JWT)
          accessToken: result.accessToken!,   // Token de acesso
          refreshToken: result.refreshToken!, // Token de atualização
        );
      } else {
        // Se não houver resultado, lança uma exceção
        throw Exception('Login falhou: Nenhum resultado retornado.');
      }
    } catch (e) {
      // Captura e lança qualquer exceção ocorrida durante o processo de login
      throw Exception('Erro ao fazer login: $e');
    }
  }

  // Método para realizar o cadastro do usuário
  @override
  Future<UserModel> signUp() async {
    // Em muitos casos, o fluxo de cadastro e login é o mesmo.
    // Portanto, este método simplesmente reutiliza o método de login.
    return login();
  }

  // Método para realizar o logout do usuário
  @override
  Future<void> logout() async {
    // Implementação do logout se necessário.
    // Por exemplo, limpar tokens armazenados ou revogar o token de acesso.
  }
}
