import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class MyWishInstructionsSection extends StatelessWidget {
  const MyWishInstructionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInstructionItem(
          number: '1',
          text: 'Escreva no campo as suas orientações e desejos.',
        ),
        SizedBox(height: 8.h),
        _buildInstructionItem(
          number: '2',
          text:
              'Você pode manter, editar ou criar uma nova sugestão dos desejos.',
        ),
      ],
    );
  }

  Widget _buildInstructionItem({required String number, required String text}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.w,
            backgroundColor: AppColors.pink,
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackDefault,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
