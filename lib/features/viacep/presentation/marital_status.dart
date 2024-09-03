import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../account/controller/account_controller.dart';
import '../../main/presentation/main_screen.dart';
import '../controller/viacep_controller.dart';

class MaritalStatusScreen extends StatelessWidget {
  MaritalStatusScreen({super.key});

  final ViaCepController viaCepController = Get.find<ViaCepController>();
  final AccountController accountController =
      Get.find<AccountController>(); // Obtenha o AccountController
  final TextEditingController cepController = TextEditingController();

  // Lista de estados civis
  final List<String> maritalStatusOptions = [
    'Solteiro',
    'Casado',
    'Divorciado(a)',
    'Viúvo(a)',
    'União Estável',
  ];

  final RxString selectedMaritalStatus = 'Solteiro'.obs; // Estado inicial

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
            Text(
              'Selecione o seu estado civil',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Obx(() {
              return Wrap(
                spacing: 8.0.w,
                runSpacing: 8.0.h,
                children: maritalStatusOptions.map((status) {
                  return ChoiceChip(
                    label: Text(status),
                    selected: selectedMaritalStatus.value == status,
                    onSelected: (bool selected) {
                      if (selected) {
                        selectedMaritalStatus.value = status;
                      }
                    },
                    selectedColor: AppColors.pink,
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: selectedMaritalStatus.value == status
                          ? Colors.white
                          : Colors.black,
                    ),
                  );
                }).toList(),
              );
            }),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () async {
                // Salvar o estado civil selecionado
                await accountController
                    .updateMaritalStatus(selectedMaritalStatus.value);
                Get.back(); // Voltar para a tela anterior
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pink,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'SALVAR',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                builder: (context) => const MainScreen(),
                settings: RouteSettings(arguments: index)),
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }
}
