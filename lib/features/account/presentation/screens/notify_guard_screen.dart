import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../../core/widgets/rectangle_card.dart';
import '../../../../generated/l10n.dart';
import '../widgets/access_description.dart';
import '../widgets/login_header.dart';

class LoginExecuteScreen extends StatelessWidget {
  const LoginExecuteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    containerHeight: 350.0,
                    gradientHeight: 120.0,
                    logoTopPosition: 180.0,
                    logoWidth: 130.0,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    S.of(context).accessArea,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const AccessDescription(),
                  ),
                  SizedBox(height: 24.h),
                  CofreCard(
                    title: S.of(context).accessKey,
                    backgroundColor: AppColors.pink,
                    width: double.infinity,
                    height: 220.h,
                    titleFontSize: 16.0.sp,
                    bold: true,
                    buttonText: S.of(context).access,
                    onButtonPressed: () {
                      print('Botão pressionado');
                    },
                    buttonColor: AppColors.primary,
                    buttonTextColor: Colors.white,
                    buttonFontSize: 16.0.sp,
                    buttonWidth: 360.w,
                    buttonBorderRadius: 8.0.r,
                    onTextFieldChanged: (value) {},
                    description: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: S.of(context).enterAccessKeyPart1),
                            TextSpan(
                              text: S.of(context).enterAccessKeyPart2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: S.of(context).enterAccessKeyPart3),
                            TextSpan(
                              text: S.of(context).enterAccessKeyPart4,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: S.of(context).enterAccessKeyPart5),
                          ],
                        ),
                      ),
                    ),
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
