import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guarda_digital_flutter/core/widgets/generic_header.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_infos_tab/personal_info_section.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_infos_tab/profile_indicator.dart';
import 'package:guarda_digital_flutter/core/widgets/user_settings_card.dart';
import '../../../../core/widgets/action_button_widget.dart';
import '../../../../styles.dart';

class UserSettingsMyInfos extends StatelessWidget {
  const UserSettingsMyInfos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GenericHeader(
                text: 'MINHAS INFORMAÇÕES',
                backgroundColor: AppColors.pink,
                onPressed: () {},
              ),
              const UserProfileCard(
                imagePath:
                    'assets/img/parents-with-their-children-walking-forest 1.png',
                userName: 'Jorge Almeida',
              ),
              SizedBox(height: 10.h),
              const ProgressIndicatorWithLabel(
                progress: 0.8,
                label: 'Preencha todos os dados',
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.r,
                      offset: Offset(0, 4.h),
                    ),
                  ],
                ),
                child: const PersonalInfoSection(),
              ),
              SizedBox(height: 20.h),
              const Text(
                'Conjugue',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const UserProfileCard(
                imagePath:
                    'assets/img/parents-with-their-children-walking-forest 1.png',
                userName: 'Jorge Almeida',
                additionalText: '276.805.056-20',
              ),
              SizedBox(height: 10.h),
              ActionButton(
                icon: SvgPicture.asset(
                  'assets/icon/add_ic.svg',
                  width: 24.w,
                  height: 24.h,
                ),
                text: 'CONJUGE',
                onPressed: () {},
                textColor: Colors.white,
                buttonColor: AppColors.pink,
                fontSize: 14.sp,
                borderRadius: 15.r,
                width: double.infinity,
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
