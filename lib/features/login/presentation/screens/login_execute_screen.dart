import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../../core/widgets/rectangle_card.dart';
import '../../../../generated/l10n.dart';

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
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 0.4.sh, // Proporcional ao tamanho da tela
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
                          height: 0.2.sh, // Proporcional ao tamanho da tela
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
                        top: 0.15.sh,
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
                  Text(
                    S.of(context).accessArea,
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: S.of(context).accessContentPart1,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: S.of(context).accessContentPart2,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: S.of(context).accessContentPart3,
                          ),
                          TextSpan(
                            text: S.of(context).accessContentPart4,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: S.of(context).accessContentPart5,
                          ),
                          TextSpan(
                            text: S.of(context).accessContentPart6,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CofreCard(
                    title: S.of(context).accessKey,
                    backgroundColor: AppColors.pink,
                    width: 340.w,
                    height: 300.h,
                    titleFontSize: 18.0.sp,
                    bold: true,
                    buttonText: S.of(context).access,
                    onButtonPressed: () {
                      print('Botão pressionado');
                    },
                    buttonColor: AppColors.primary,
                    buttonTextColor: Colors.white,
                    buttonFontSize: 18.0.sp,
                    buttonWidth: 400.w,
                    buttonBorderRadius: 12.0.r,
                    onTextFieldChanged: (value) {},
                    description: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: S.of(context).enterAccessKeyPart1),
                          TextSpan(
                            text: S.of(context).enterAccessKeyPart2,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: S.of(context).enterAccessKeyPart3),
                          TextSpan(
                            text: S.of(context).enterAccessKeyPart4,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: S.of(context).enterAccessKeyPart5),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
