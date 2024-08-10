// import 'package:get/get.dart';
// import '../data/repositories/auth_repository.dart';

// class AuthController extends GetxController {
//   final AuthRepository repository;

//   AuthController(this.repository);

//   var isLoading = false.obs;
//   var errorMessage = Rxn<String>();

//   Future<void> login() async {
//     isLoading.value = true;
//     final result = await repository.login();
//     result.fold(
//       (failure) => errorMessage.value = 'Failed to login: ${failure.message}',
//       (_) => print('Login successful'),
//     );
//     isLoading.value = false;
//   }

//   Future<void> logout() async {
//     isLoading.value = true;
//     final result = await repository.logout();
//     result.fold(
//       (failure) => errorMessage.value = 'Failed to logout: ${failure.message}',
//       (_) => print('Logout successful'),
//     );
//     isLoading.value = false;
//   }

//   Future<String?> getAccessToken() async {
//     final result = await repository.getAccessToken();
//     return result.fold(
//       (failure) {
//         errorMessage.value = 'Failed to retrieve access token: ${failure.message}';
//         return null;
//       },
//       (token) => token,
//     );
//   }
// }
