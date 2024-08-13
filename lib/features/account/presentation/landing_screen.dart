import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../generated/l10n.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../widgets/login_header.dart';
import '../widgets/notification_button.dart';
import '../widgets/option_button.dart';
import '../../../features/account/controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = GetIt.instance<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LoginHeader(
                    containerHeight: 400.0,
                    gradientHeight: 150.0,
                    logoTopPosition: 220.0,
                    logoWidth: 150.0,
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: OptionButton(
                      text: S.of(context).signIn,
                      onPressed: () async {
                        // Inicia o fluxo de autenticação diretamente
                        await authController.signIn();

                        if (authController.user.value != null) {
                          Navigator.pushNamed(context, AppRoutes.main); // Navegue para a tela principal após o login
                        } else {
                          // Exibe uma mensagem de erro caso o login falhe
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Falha no login, tente novamente.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      buttonColor: AppColors.primary,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: OptionButton(
                      text: S.of(context).signUp,
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.signUpScreen);
                      },
                      buttonColor: AppColors.pink,
                      textColor: AppColors.onPrimary,
                      iconPath: 'assets/icon/cadastrar_ic.svg',
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '${S.of(context).uAre} ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: S.of(context).executor,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextSpan(text: ' ${S.of(context).or} '),
                          TextSpan(
                            text: S.of(context).beneficiary,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextSpan(
                            text: ' ${S.of(context).clickBelow}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const NotificationButton(),
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
