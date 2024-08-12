import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';
import '../widgets/instructions_section.dart';
import '../widgets/recommendations_section.dart';

class TributeContent extends StatelessWidget {
  const TributeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RectangleButton(
                text: 'HOMENAGEM',
                color: AppColors.pink,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              _buildContentCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitleSection(),
            SizedBox(height: 16.h),
            const RecommendationsSection(),
            SizedBox(height: 16.h),
            const InstructionsSection(),
            SizedBox(height: 16.h),
            ActionButton(
              icon: SvgPicture.asset(
                'assets/icon/arrow_foward_ic.svg',
                width: 12.w,
                height: 12.h,
              ),
              text: 'CRIAR HOMENAGEM PARA MIM',
              onPressed: () {},
              textColor: Colors.white,
              buttonColor: AppColors.primary,
              fontSize: 12.sp,
              borderRadius: 10.r,
              width: double.infinity,
              height: 40.h,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Homenagem',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Registre como será seu ultimo momento',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.blackDefault,
          ),
        ),
      ],
    );
  }
}
