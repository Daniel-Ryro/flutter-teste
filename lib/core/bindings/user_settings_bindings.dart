import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/login/controllers/auth_controller.dart';
import 'package:guarda_digital_flutter/core/di/injection.dart';

import '../../features/account/controller/account_controller.dart';

class UserSettingsBindings extends Bindings {
  @override
  void dependencies() {
    // Configura as dependências necessárias para a tela de configurações do usuário
    Get.lazyPut<AuthController>(() => sl<AuthController>());
    Get.lazyPut<AccountController>(() => sl<AccountController>());
  }
}
