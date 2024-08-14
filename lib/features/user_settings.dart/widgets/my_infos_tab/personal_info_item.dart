import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

class PersonalInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData? trailingIcon;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  const PersonalInfoItem({
    super.key,
    required this.title,
    required this.value,
    this.trailingIcon,
    this.backgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(
          left: 5.w,
          right: 16.w,
          top: 12.h,
          bottom: 12.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            if (trailingIcon != null)
              Icon(
                trailingIcon,
                color: AppColors.onBackground,
                size: 24.r,
              ),
          ],
        ),
      ),
    );
  }
}
