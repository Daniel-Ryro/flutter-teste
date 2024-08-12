import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../styles.dart';

class DocumentItem extends StatelessWidget {
  final String title;

  const DocumentItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        leading: SvgPicture.asset(
          'assets/icon/file_ic.svg',
          width: 24.w,
          height: 24.h,
          color: AppColors.primary,
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.onBackground,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}
