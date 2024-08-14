import 'package:flutter_appauth/flutter_appauth.dart';
import '../../../../core/utils/constants.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login();
  Future<UserModel> signUp();
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FlutterAppAuth _appAuth;

  AuthRemoteDataSourceImpl({
    required FlutterAppAuth appAuth,
  }) : _appAuth = appAuth;

  @override
  Future<UserModel> login() async {
    final AuthorizationTokenRequest request = AuthorizationTokenRequest(
      ApiConstants.clientId,
      ApiConstants.redirectUri,
      issuer: ApiConstants.issuer,
      scopes: ApiConstants.scopes,
    );

    try {
      final AuthorizationTokenResponse? result =
          await _appAuth.authorizeAndExchangeCode(request);

      if (result != null) {
        return UserModel(
          idToken: result.idToken!,
          accessToken: result.accessToken!,
          refreshToken: result.refreshToken!,
        );
      } else {
        throw Exception('Login falhou: Nenhum resultado retornado.');
      }
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  @override
  Future<UserModel> signUp() async {
    // Em muitos casos, o fluxo de cadastro e login são o mesmo em termos de lógica.
    return login();
  }

  @override
  Future<void> logout() async {
    // Implementação do logout se necessário
    // Por exemplo, limpar tokens armazenados
  }
}
