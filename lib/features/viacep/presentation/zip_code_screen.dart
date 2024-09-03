import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../account/controller/account_controller.dart';
import '../../main/presentation/main_screen.dart';
import '../controller/viacep_controller.dart';

class ZipCodeScreen extends StatelessWidget {
  ZipCodeScreen({super.key});

  final ViaCepController viaCepController = Get.find<ViaCepController>();
  final AccountController accountController = Get.find<AccountController>();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController numberController = TextEditingController(); // Controlador para o número
  final TextEditingController complementController = TextEditingController(); // Novo controlador para o complemento

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      appBar: CustomAppBar(
        iconPaths: const [
          'assets/icon/notification_ic.svg',
          'assets/icon/help_ic.svg',
          'assets/icon/user_setting_ic.svg',
        ],
        iconActions: [
          () {
            Navigator.pushNamed(context, AppRoutes.notificationScreen);
          },
          () {
            Navigator.pushNamed(context, AppRoutes.helpScreen);
          },
          () {
            Navigator.pushNamed(context, AppRoutes.userSettings);
          },
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Digite o CEP/Zip Code de onde você mora',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Não sei o cep',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextField(
                    controller: cepController,
                    decoration: InputDecoration(
                      hintText: 'Digite seu CEP/Zip Code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      // Limpar o estado ao alterar o CEP
                      viaCepController.resetState();
                    },
                  ),
                  SizedBox(height: 12.h),
                  TextField(
                    controller: numberController,
                    decoration: InputDecoration(
                      hintText: 'Número do endereço',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 12.h),
                  TextField(
                    controller: complementController,
                    decoration: InputDecoration(
                      hintText: 'Complemento',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Obx(() {
                    return ActionButton(
                      text: viaCepController.buttonText.value,
                      onPressed: () async {
                        String cep = cepController.text;
                        String number = numberController.text; // Obtém o número
                        String complement = complementController.text; // Obtém o complemento
                        
                        if (cep.isNotEmpty && number.isNotEmpty) {
                          if (viaCepController.buttonText.value == 'CONTINUE') {
                            await viaCepController.fetchCepData(cep);
                            if (viaCepController.errorMessage.value.isEmpty) {
                              Get.snackbar('Sucesso', 'Dados do CEP carregados');
                              viaCepController.buttonText.value = 'Usar CEP';
                            } else {
                              Get.snackbar('Erro', viaCepController.errorMessage.value);
                            }
                          } else {
                            final address =
                                '${viaCepController.cepModel.value?.logradouro}, $number, $complement, ${viaCepController.cepModel.value?.bairro}, ${viaCepController.cepModel.value?.localidade} - ${viaCepController.cepModel.value?.uf}';
                            accountController.updateAddress(address);
                            Navigator.pop(context);
                          }
                        } else {
                          Get.snackbar('Erro', 'Por favor, digite um CEP e número válidos');
                        }
                      },
                      textColor: Colors.white,
                      buttonColor: AppColors.pink,
                      fontSize: 14.sp,
                      borderRadius: 5.r,
                      width: double.infinity,
                      height: 40.h,
                    );
                  }),
                  SizedBox(height: 20.h),
                  Obx(() {
                    if (viaCepController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (viaCepController.errorMessage.value.isNotEmpty) {
                      return Text(
                        viaCepController.errorMessage.value,
                        style: TextStyle(color: Colors.red, fontSize: 14.sp),
                      );
                    } else if (viaCepController.cepModel.value != null) {
                      final cepData = viaCepController.cepModel.value!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CEP: ${cepData.cep}'),
                          Text('Logradouro: ${cepData.logradouro}'),
                          Text('Complemento: ${cepData.complemento}'),
                          Text('Bairro: ${cepData.bairro}'),
                          Text('Localidade: ${cepData.localidade}'),
                          Text('UF: ${cepData.uf}'),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTabSelected: (index) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen(),
                settings: RouteSettings(arguments: index)),
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }
}
