import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class LoginHeader extends StatelessWidget {
  final double containerHeight;
  final double imageHeight;
  final double gradientHeight;
  final double logoTopPosition;
  final double logoWidth;

  const LoginHeader({
    Key? key,
    this.containerHeight = 400.0,
    this.imageHeight = 400.0,
    this.gradientHeight = 150.0,
    this.logoTopPosition = 220.0,
    this.logoWidth = 150.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: containerHeight.h,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                  'assets/img/parents-with-their-children-walking-forest 1.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: gradientHeight.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
          ),
        ),
        Positioned(
          top: logoTopPosition.h,
          left: 0,
          right: 0,
          child: Center(
            child: SvgPicture.asset(
              'assets/icon/guarda_logo_ic.svg',
              width: logoWidth.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
