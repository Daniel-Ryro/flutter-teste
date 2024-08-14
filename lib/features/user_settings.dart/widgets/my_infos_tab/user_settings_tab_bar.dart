import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/tab_icon_row_widget.dart';

class UserSettingsTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const UserSettingsTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TabIconRow(
        icons: const [
          'assets/icon/user_setting_white_ic.svg',
          'assets/icon/my_plan_ic.svg',
          'assets/icon/family_settings_ic.svg',
          'assets/icon/contact_ic.svg',
        ],
        selectedIndex: selectedIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}
