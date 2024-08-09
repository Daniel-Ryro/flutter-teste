import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/action_button_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../routes/app_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: SingleChildScrollView(
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
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 480.h,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/img/parents-with-their-children-walking-forest 1.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 500.h,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.white,
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 300.h,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icon/guarda-digital.svg',
                          width: 198.w,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                ActionButton(
                  text: S.of(context).signIn,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signInScreen);
                  },
                  buttonColor: AppColors.primary,
                  textColor: Colors.white,
                  fontSize: 16.sp,
                  borderRadius: 22.r,
                  borderColor: Colors.transparent,
                  width: 301.w,
                  isBold: false,
                ),
                SizedBox(height: 31.h),
                ActionButton(
                  text: S.of(context).signUp,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signUpScreen);
                  },
                  buttonColor: AppColors.pink,
                  textColor: AppColors.onPrimary,
                  fontSize: 16.sp,
                  borderRadius: 22.r,
                  width: 301.w,
                  icon: SvgPicture.asset(
                    'assets/icon/cadastrar.svg',
                    width: 20.w,
                  ),
                ),
                SizedBox(height: 42.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: RichText(
                    textAlign: TextAlign.start,
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
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: ActionButton(
                    text: S.of(context).notifyGuardian,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginExecute);
                    },
                    buttonColor: AppColors.pink,
                    textColor: AppColors.onPrimary,
                    fontSize: 16.sp,
                    borderRadius: 22.r,
                    width: 301.w,
                    isBold: false,
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
