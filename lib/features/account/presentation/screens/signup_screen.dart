import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/action_button_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';
import '../widgets/back_button_row.dart';
import '../widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      'assets/icon/guarda-digital.svg',
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
                    ),
                    SizedBox(height: 20.h),
                    ActionButton(
                      text: S.of(context).sendVerificationCode,
                      onPressed: () {},
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
                    ),
                    SizedBox(height: 20.h),
                    TextInputField(
                      labelText: S.of(context).confirmNewPassword,
                      isObscure: true,
                    ),
                    SizedBox(height: 40.h),
                    ActionButton(
                      text: S.of(context).create,
                      onPressed: () {},
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
