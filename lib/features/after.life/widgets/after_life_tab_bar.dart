import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';

class AfterLifeTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const AfterLifeTabBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TabIconRow(
        icons: const [
          'assets/icon/money_file_ic.svg',
          'assets/icon/file_file_ic.svg',
          'assets/icon/fire_ic.svg',
          'assets/icon/heart_favorite_ic.svg',
        ],
        selectedIndex: selectedIndex,
        onTabSelected: onTabSelected,
      ),
    );
  }
}
