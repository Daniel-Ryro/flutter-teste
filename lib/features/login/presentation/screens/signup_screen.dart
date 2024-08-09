import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/action_button_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../styles.dart';

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
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).cancel,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).emailAddress,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          decoration: InputDecoration(
                            labelText: S.of(context).emailAddress,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    ActionButton(
                      text: S.of(context).sendVerificationCode,
                      onPressed: () {},
                      buttonColor: AppColors.primaryVariant,
                      textColor: Colors.white,
                      fontSize: 16.sp,
                      borderRadius: 8.r,
                      borderColor: Colors.transparent,
                      width: 230.w,
                      isBold: false,
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).newPassword,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          decoration: InputDecoration(
                            labelText: S.of(context).newPassword,
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).confirmNewPassword,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextField(
                          decoration: InputDecoration(
                            labelText: S.of(context).confirmNewPassword,
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: true,
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                        backgroundColor: Colors.blue.withOpacity(0.5),
                      ),
                      child: Text(
                        S.of(context).create,
                        style: TextStyle(
                            fontSize: 16.sp, color: AppColors.background),
                      ),
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
