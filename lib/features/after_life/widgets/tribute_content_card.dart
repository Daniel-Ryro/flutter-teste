import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guarda_digital_flutter/features/after_life/widgets/tribute_title_section.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../styles.dart';
import '../widgets/instructions_section.dart';
import '../widgets/recommendations_section.dart';

class TributeContentCard extends StatelessWidget {
  const TributeContentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TributeTitleSection(),
            SizedBox(height: 16.h),
            const RecommendationsSection(),
            SizedBox(height: 16.h),
            const GeneralInstructionsSection(),
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
}
