import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabeledTextField(
          label: 'Executores',
          hint:
              'Escreva no campo abaixo instruções e desejos para os Executores',
        ),
        SizedBox(height: 16.h),
        _buildLabeledTextField(
          label: 'Beneficiários',
          hint:
              'Escreva no campo abaixo instruções e desejos para os Beneficiários',
        ),
      ],
    );
  }

  Widget _buildLabeledTextField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          hint,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Descrição',
            hintStyle: TextStyle(color: Colors.grey[500]),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
          ),
        ),
      ],
    );
  }
}
