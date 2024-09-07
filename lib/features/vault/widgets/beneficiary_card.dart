import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../account/data/models/beneficiary_model.dart';

class BeneficiaryCard extends StatelessWidget {
  final BeneficiaryModel beneficiary;

  const BeneficiaryCard({super.key, required this.beneficiary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.pink, // Cor de fundo do card
        borderRadius: BorderRadius.circular(8.r), // Bordas arredondadas
      ),
      child: Row(
        children: [
          Icon(
            Icons.group, // Ícone de grupo para beneficiários
            color: Colors.white,
            size: 24.sp,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              beneficiary.name, // Nome do beneficiário
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            beneficiary.statusExecutor.toString(), // Status do beneficiário
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
