import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles.dart';
import 'icon_rounded_button.dart';

class TabIconRow extends StatelessWidget {
  final List<String> icons;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TabIconRow({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: icons.asMap().entries.map((entry) {
        int index = entry.key;
        String iconPath = entry.value;
        return Padding(
          padding: EdgeInsets.only(right: index < icons.length - 1 ? 10.w : 0),
          child: IconRoundedButton(
            svgPath: iconPath,
            color: selectedIndex == index ? AppColors.pink : AppColors.primary,
            onPressed: () => onTabSelected(index),
            width: 64.w,
            height: 64.h,
            iconSize: 36.sp,
            iconColor: Colors.white,
          ),
        );
      }).toList(),
    );
  }
}
