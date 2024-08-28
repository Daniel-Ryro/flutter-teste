import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles.dart';

class GeneralInstructionsSection  extends StatelessWidget {
  const GeneralInstructionsSection ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instruções',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 8.h),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: AppColors.pink, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  Icons.info,
                  color: AppColors.pink,
                  size: 24.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    '1 Informações Básicas\nComece mencionando seu nome completo, data de nascimento e lugar de nascimento.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.blackDefault,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
