import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class MyFilesHeader extends StatelessWidget {
  const MyFilesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        'LIVRO DE LEMBRANÇAS',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
    );
  }
}
