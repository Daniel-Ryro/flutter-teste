import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/login/controllers/auth_controller.dart';
import '../../core/di/injection.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(sl<AuthController>(), permanent: true);
  }
}
