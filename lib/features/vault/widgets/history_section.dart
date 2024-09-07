import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';
import '../../../core/widgets/list_item.dart';

Widget buildHistorySection() {
  return ListItem(
    text: 'histórico versão cofre',
    onTap: () {},
    boxDecorationColor: AppColors.background,
    fontSize: 16.sp,
    iconColor: Colors.black,
    iconSize: 24.sp,
    textColor: Colors.black,
  );
}
