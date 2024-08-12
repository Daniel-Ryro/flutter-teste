import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';  // Importando o pacote flutter_svg
import '../../../styles.dart';

class AddFileOption extends StatelessWidget {
  final String svgIconPath;
  final String label;
  final VoidCallback onTap;

  const AddFileOption({
    super.key,
    required this.svgIconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: ListTile(
        leading: SvgPicture.asset(
          svgIconPath,
          width: 32.w,
          height: 32.h,
          color: AppColors.blackDefault,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.blackDefault),
        onTap: onTap,
      ),
    );
  }
}
