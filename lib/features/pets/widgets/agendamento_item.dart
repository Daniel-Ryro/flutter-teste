import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles.dart';

class AgendamentoItem extends StatelessWidget {
  final String date;
  final String title;
  final VoidCallback? onTap;

  const AgendamentoItem({
    super.key,
    required this.date,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(Icons.calendar_today, color: AppColors.primary, size: 20.w),
              SizedBox(width: 8.w),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap ?? () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            elevation: 2,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          
        ),
        Divider(
          color: AppColors.primary,
          thickness: 1,
          indent: 16.w,
          endIndent: 16.w,
        ),
      ],
    );
  }
}
