// import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import '../../../../core/utils/constants.dart';

// class AuthRemoteDataSource {
//   final FlutterAppAuth appAuth;
//   final FlutterSecureStorage secureStorage;

//   AuthRemoteDataSource({required this.appAuth, required this.secureStorage});

//   Future<void> login() async {
//     try {
//       final AuthorizationTokenResponse? result =
//           await appAuth.authorizeAndExchangeCode(
//         AuthorizationTokenRequest(
//           ApiConstants.clientId,
//           ApiConstants.redirectUri,
//           issuer: ApiConstants.issuer,
//           scopes: ApiConstants.scopes,
//           serviceConfiguration: const AuthorizationServiceConfiguration(
//             authorizationEndpoint: ApiConstants.authorizationEndpoint,
//             tokenEndpoint: ApiConstants.tokenEndpoint,
//           ),
//         ),
//       );

//       if (result != null) {
//         await secureStorage.write(
//             key: 'access_token', value: result.accessToken);
//       }
//     } catch (e) {
//       print('Error during login: $e');
//     }
//   }

//   Future<void> logout() async {
//     await secureStorage.delete(key: 'access_token');
//   }

//   Future<String?> getAccessToken() async {
//     return await secureStorage.read(key: 'access_token');
//   }
// }
