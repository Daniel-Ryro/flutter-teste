import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'beneficiary_card.dart';

class BeneficiariesSection extends StatelessWidget {
  const BeneficiariesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Beneficiário escolhidos',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Seus beneficiários cadastrados',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 12.h),
        const BeneficiaryCard(
          name: 'Jose Carlos',
          backgroundColor: AppColors.pink,
        ),
        const BeneficiaryCard(
          name: 'Jose Carlos',
          backgroundColor: AppColors.pink,
        ),
      ],
    );
  }
}
