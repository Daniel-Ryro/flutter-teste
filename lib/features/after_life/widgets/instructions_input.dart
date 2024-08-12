import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles.dart';

class InstructionsInput extends StatelessWidget {
  const InstructionsInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instruções',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.blackDefault,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Instruções',
            contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
