import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';
import '../../account/data/models/beneficiary_model.dart';
import 'beneficiary_card.dart'; // Importe o BeneficiaryCard

class BeneficiariesSection extends StatelessWidget {
  final List<BeneficiaryModel> beneficiaries;

  const BeneficiariesSection({super.key, required this.beneficiaries});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Text(
            'Beneficiários',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        beneficiaries.isEmpty
            ? const Center(child: Text('Nenhum beneficiário encontrado.'))
            : Column(
                children: beneficiaries
                    .map((beneficiary) => BeneficiaryCard(beneficiary: beneficiary))
                    .toList(), // Certifique-se de usar toList() corretamente
              ),
      ],
    );
  }
}
