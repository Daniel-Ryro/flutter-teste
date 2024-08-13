import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repositories/auth_repository.dart';
import '../domain/entities/user.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  // Adicionando TextEditingControllers para email e senha
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var user = Rx<User?>(null);
  var errorMessage = Rx<String?>(null);

  AuthController(this._authRepository);

  Future<void> signIn() async {
    try {
      // Aqui você pode usar emailController.text e passwordController.text
      user.value = await _authRepository.signIn();

      if (user.value == null) {
        errorMessage.value = 'Falha no login';
      } else {
        errorMessage.value = null;
      }
    } catch (e) {
      errorMessage.value = 'Erro durante o login: $e';
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    user.value = null;
  }

  @override
  void dispose() {
    // Certifique-se de descartar os controladores ao descartar o controller
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
