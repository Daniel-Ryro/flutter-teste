

// import '../repositories/auth_repository.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final MSALPublicClientApplication _msalClient;
  
//   AuthRepositoryImpl(this._msalClient);

//   @override
//   Future<User?> signIn() async {
//     try {
//       final result = await _msalClient.acquireTokenInteractive(
//         ['User.Read'],
//         authority: 'https://guardadigitalb2c.b2clogin.com/tfp/guardadigitalb2c.onmicrosoft.com/B2C_1_signin',
//         redirectUri: 'br.com.guardadigital.authapp://oauthredirect',
//       );

//       if (result != null) {
//         return User(
//           id: result.account.identifier,
//           name: result.account.username,
//           email: result.account.username,
//         );
//       }
//     } catch (e) {
//       print('Login failed: $e');
//     }
//     return null;
//   }

//   @override
//   Future<void> signOut() async {
//     try {
//       await _msalClient.signOut();
//     } catch (e) {
//       print('Logout failed: $e');
//     }
//   }
// }
