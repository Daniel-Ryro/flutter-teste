import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../account/data/models/executor_model.dart';
import 'executor_card.dart';

class ExecutorsSection extends StatelessWidget {
  final List<ExecutorModel> executors;

  const ExecutorsSection({super.key, required this.executors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Executor escolhidos',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Seu executor cadastrado',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 12.h),
        // Itera sobre a lista de executores e cria um ExecutorCard para cada um
        ...executors.map((executor) => ExecutorCard(executor: executor)).toList(),
      ],
    );
  }
}
