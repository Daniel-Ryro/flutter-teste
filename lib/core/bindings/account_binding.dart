import 'package:get/get.dart';
import '../../../core/di/injection.dart';
import '../../features/account/controller/account_controller.dart';

class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => sl<AccountController>());
  }
}
