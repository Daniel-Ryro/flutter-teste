import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../account/data/models/executor_model.dart'; // Import da model ExecutorModel

class ExecutorCard extends StatelessWidget {
  final ExecutorModel executor; // Aceita um ExecutorModel como argumento

  const ExecutorCard({
    super.key,
    required this.executor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.groups, color: AppColors.background, size: 24.sp),
              SizedBox(width: 8.w),
              Text(
                'Executor ${executor.firstName} ${executor.lastName}',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.background,
                ),
              ),
            ],
          ),
          Text(
            executor.statusExecutorLabel, // Usa o status diretamente do ExecutorModel
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.background,
            ),
          ),
        ],
      ),
    );
  }
}
