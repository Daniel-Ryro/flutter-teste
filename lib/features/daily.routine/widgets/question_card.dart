import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const QuestionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.blackDefault,
          ),
        ),
        trailing:
            const Icon(Icons.chevron_right, color: AppColors.blackDefault),
        tileColor: color,
        onTap: () {},
      ),
    );
  }
}
