import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class AddPersonRow extends StatelessWidget {
  const AddPersonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildAddPersonButton(),
        SizedBox(width: 8.w),
        _buildPersonAvatar(),
        SizedBox(width: 8.w),
        _buildPersonAvatar(),
        SizedBox(width: 8.w),
        _buildPersonAvatar(),
      ],
    );
  }

  Widget _buildAddPersonButton() {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.add, color: Colors.white, size: 24.w),
    );
  }

  Widget _buildPersonAvatar() {
    return CircleAvatar(
      radius: 25.w,
      backgroundColor: AppColors.primary.withOpacity(0.1),
      child: Icon(
        Icons.person,
        size: 24.w,
        color: AppColors.primary,
      ),
    );
  }
}
