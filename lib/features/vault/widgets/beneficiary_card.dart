import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

class BeneficiaryCard extends StatelessWidget {
  final String name;
  final Color backgroundColor;

  const BeneficiaryCard({
    super.key,
    required this.name,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(Icons.person, color: AppColors.background, size: 24.sp),
          SizedBox(width: 8.w),
          Text(
            'Beneficiario $name',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
          ),
        ],
      ),
    );
  }
}
