import 'package:get/get.dart';

import '../../features/viacep/controller/viacep_controller.dart';
import '../../features/viacep/domain/usecases/get_cep_data.dart';
import '../di/injection.dart';

class ViaCepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViaCepController>(() => ViaCepController(sl<GetCepData>()));
  }
}
