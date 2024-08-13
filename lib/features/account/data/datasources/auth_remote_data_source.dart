import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User?> signIn();
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FlutterAppAuth appAuth;
  final FlutterSecureStorage secureStorage;

  AuthRemoteDataSourceImpl({
    required this.appAuth,
    required this.secureStorage,
  });

  @override
  Future<User?> signIn() async {
    try {
      final AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          'msal6f93a629-c8b4-4407-9881-a69f1db2d03a', // Insira seu clientId
          'br.com.guardadigital.authapp://oauthredirect',
          issuer: 'https://guardadigitalb2c.b2clogin.com/tfp/guardadigitalb2c.onmicrosoft.com/B2C_1_signin',
          scopes: ['openid', 'profile', 'email'],
        ),
      );

      if (result != null) {
        return User(
          id: result.idToken!,
          name: result.idToken!, // Ajuste conforme necessário
          email: result.idToken!, // Ajuste conforme necessário
        );
      }
    } catch (e) {
      print('Login failed: $e');
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    // Implemente a lógica de sign out, se necessário
  }
}
