import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'package:guarda_digital_flutter/core/widgets/action_button_widget.dart';
import '../../../generated/l10n.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/forgot_password_link.dart';

class SignInScreen extends StatelessWidget {
  //final AuthController authController = GetIt.instance<AuthController>();

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: Center(
        child: Container(
          width: 350.w,
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5.r,
                blurRadius: 7.r,
                offset: Offset(0, 3.h),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icon/guarda_logo_ic.svg',
                height: 198.h,
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).signIn,
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).signIn,
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                labelText: S.of(context).emailAddress,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                labelText: S.of(context).newPassword,
                obscureText: true,
              ),
              SizedBox(height: 16.h),
              const ForgotPasswordLink(),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.bottomLeft,
                child: ActionButton(
                  text: S.of(context).signIn,
                  onPressed: _handleSignIn,
                  buttonColor: AppColors.primary,
                  textColor: Colors.white,
                  fontSize: 16.sp,
                  borderRadius: 8.r,
                  width: 250.w,
                  isBold: true,
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSignIn() async {
    // await authController.login();

    // if (authController.errorMessage.value != null) {
    //   Get.snackbar(
    //     'Erro',
    //     authController.errorMessage.value!,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    // } else {
    //   Get.snackbar(
    //     'Sucesso',
    //     'Login realizado com sucesso',
    //     backgroundColor: Colors.green,
    //     colorText: Colors.white,
    //   );
    // }
  }
}
