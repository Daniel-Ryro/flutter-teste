import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../styles.dart';

class MedicalHistoryContent extends StatelessWidget {
  const MedicalHistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ActionButton(
                text: 'Importação Exames',
                onPressed: () {},
                textColor: Colors.white,
                buttonColor: AppColors.pink,
                fontSize: 14.sp,
                borderRadius: 20.r,
                width: 245.w,
                height: 45.h,
                icon: SvgPicture.asset(
                  'assets/icon/medical_import_ic.svg',
                  width: 21.w,
                  height: 24.h,
                ),
              ),
              Container(
                width: 57.w,
                height: 45.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildDateSection('24/03/2024'),
          _buildMedicalRecordItem('Colesterol'),
          _buildMedicalRecordItem('Hemograma'),
          SizedBox(height: 16.h),
          _buildDateSection('24/03/2024'),
          _buildMedicalRecordItem('Teste ergométrico'),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_today, color: AppColors.primary),
            SizedBox(width: 8.w),
            Text(
              date,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        const Divider(color: AppColors.primary),
      ],
    );
  }

  Widget _buildMedicalRecordItem(String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        leading: const Icon(Icons.description, color: AppColors.primary),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.blackDefault,
              fontSize: 16.sp,
            ),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: AppColors.primary),
        onTap: () {},
      ),
    );
  }
}
