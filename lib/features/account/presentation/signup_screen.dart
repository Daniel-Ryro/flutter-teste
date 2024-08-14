import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart'; // Para usar o GetX
import '../../../core/di/injection.dart';
import '../controllers/auth_controller.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../generated/l10n.dart';
import '../../../styles.dart';
import '../widgets/back_button_row.dart';
import '../widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key}) {
    Get.lazyPut(() => sl<AuthController>());
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>(); // Pegando o controller

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const BackButtonRow(),
              SizedBox(height: 40.h),
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icon/guarda_logo_ic.svg',
                      width: 198.w,
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      S.of(context).userDetails,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    TextInputField(
                      labelText: S.of(context).emailAddress,
                      isObscure: false,
                      onChanged: (value) => authController.email.value = value, // Atualiza o valor no controller
                    ),
                    SizedBox(height: 20.h),
                    ActionButton(
                      text: S.of(context).sendVerificationCode,
                      onPressed: () {
                        // Implementação para enviar o código de verificação, se necessário
                      },
                      buttonColor: AppColors.sendCode,
                      textColor: Colors.white,
                      fontSize: 16.sp,
                      borderRadius: 8.r,
                      borderColor: Colors.transparent,
                      width: 230.w,
                      isBold: false,
                    ),
                    SizedBox(height: 20.h),
                    TextInputField(
                      labelText: S.of(context).newPassword,
                      isObscure: true,
                      onChanged: (value) => authController.password.value = value, // Atualiza o valor no controller
                    ),
                    SizedBox(height: 20.h),
                    TextInputField(
                      labelText: S.of(context).confirmNewPassword,
                      isObscure: true,
                    ),
                    SizedBox(height: 40.h),
                    ActionButton(
                      text: S.of(context).create,
                      onPressed: () {
                        authController.signUp(); // Chama o método de criação de conta
                      },
                      buttonColor: AppColors.sendCode,
                      textColor: Colors.white,
                      fontSize: 16.sp,
                      borderRadius: 8.r,
                      borderColor: Colors.transparent,
                      width: 200.w,
                      isBold: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
