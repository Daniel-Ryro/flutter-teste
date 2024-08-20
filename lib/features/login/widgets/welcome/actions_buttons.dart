import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../../core/widgets/action_button_widget.dart';
import '../../presentation/welcome_screen.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionButton(
          text: 'Sair',
          onPressed: () {},
          textColor: AppColors.primary,
          buttonColor: Colors.white,
          fontSize: 16.sp,
          borderRadius: 40.r,
          borderColor: AppColors.primary,
          width: 135.w,
          height: 48.h,
          isBold: true,
        ),
        ActionButton(
          text: 'Avançar',
          onPressed: () {},
          textColor: Colors.white,
          buttonColor: AppColors.pink,
          fontSize: 16.sp,
          borderRadius: 40.r,
          width: 135.w,
          height: 48.h,
          isBold: true,
        ),
      ],
    );
  }
}
