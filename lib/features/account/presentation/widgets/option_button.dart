import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/action_button_widget.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final String? iconPath;

  const OptionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      text: text,
      onPressed: onPressed,
      buttonColor: buttonColor,
      textColor: textColor,
      fontSize: 16.sp,
      borderRadius: 22.r,
      borderColor: Colors.transparent,
      width: double.infinity,
      isBold: false,
      icon: iconPath != null
          ? SvgPicture.asset(
              iconPath!,
              width: 20.w,
            )
          : null,
    );
  }
}
