import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class TributeTitleSection extends StatelessWidget {
  const TributeTitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Homenagem',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Registre como será seu ultimo momento',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.blackDefault,
          ),
        ),
      ],
    );
  }
}
