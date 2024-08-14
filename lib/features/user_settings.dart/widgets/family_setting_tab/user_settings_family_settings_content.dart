import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/core/widgets/generic_header.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/family_setting_tab/family_invite_card.dart';

import '../../../../styles.dart';
import '../../../../core/widgets/user_settings_card.dart';

class UserSettingsFamilySetting extends StatelessWidget {
  const UserSettingsFamilySetting({super.key});

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
                text: 'CONFIGURAÇÕES DE FAMILIA',
                backgroundColor: AppColors.pink,
                onPressed: () {},
              ),
              FamilyInviteCard(
                remainingInvites: 3,
                onInvitePressed: () {},
              ),
              SizedBox(height: 20.h),
              const Text(
                'Grupo Familiar',
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
                additionalText: 'ADM',
              ),
              const UserProfileCard(
                imagePath:
                    'assets/img/parents-with-their-children-walking-forest 1.png',
                userName: 'Alana Almeida',
                additionalText: 'Membro',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
