import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/action_button_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../../routes/app_routes.dart';
import '../../../../styles.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      text: S.of(context).notifyGuardian,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.loginExecute);
      },
      buttonColor: AppColors.pink,
      textColor: AppColors.onPrimary,
      fontSize: 16.sp,
      borderRadius: 22.r,
      width: double.infinity,
      isBold: false,
    );
  }
}
