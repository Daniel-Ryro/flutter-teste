import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VaultSection extends StatelessWidget {
  const VaultSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/cofre_icon.png',
          width: 40.w,
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Meu Cofre',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D2D2D),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'O resumo de todas as suas informações ficam guardadas no cofre de forma segura e acesso fácil',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xFF7B7B7B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
