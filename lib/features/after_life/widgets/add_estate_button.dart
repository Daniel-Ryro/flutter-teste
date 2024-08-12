import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../../../styles.dart';

class AddEstateButton extends StatelessWidget {
  const AddEstateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: SvgPicture.asset(
        'assets/icon/add_ic.svg',
        width: 20.w,
        height: 20.h,
      ),
      text: 'ADICIONAR PATRIMÔNIO',
      onPressed: () {},
      textColor: Colors.white,
      buttonColor: AppColors.pink,
      fontSize: 16.sp,
      borderRadius: 10.r,
      width: double.infinity,
      height: 40.h,
    );
  }
}
