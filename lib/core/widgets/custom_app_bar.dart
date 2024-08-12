import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? leftIconPath;
  final List<String> iconPaths;
  final List<VoidCallback?> iconActions;
  final double leftIconSize;

  const CustomAppBar({
    super.key,
    this.leftIconPath,
    this.iconPaths = const [],
    this.iconActions = const [],
    this.leftIconSize = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: leftIconPath != null
          ? Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: SizedBox(
                width: leftIconSize.w,
                height: leftIconSize.h,
                child: SvgPicture.asset(
                  leftIconPath!,
                  fit: BoxFit.contain,
                ),
              ),
            )
          : null,
      actions: _buildAppBarIcons(),
    );
  }

  List<Widget> _buildAppBarIcons() {
    return List<Widget>.generate(iconPaths.length, (index) {
      return IconButton(
        icon: SvgPicture.asset(iconPaths[index], width: 24.w, height: 24.h),
        onPressed: iconActions.isNotEmpty && index < iconActions.length
            ? iconActions[index]
            : null,
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
