import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

class ForgotPasswordLink extends StatelessWidget {
  const ForgotPasswordLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          // Lógica para esquecer a senha
        },
        child: Text(
          'Esqueceu a senha?',
          style: TextStyle(
            color: AppColors.primary,
            decoration: TextDecoration.underline,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
