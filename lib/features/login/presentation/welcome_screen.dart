import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../vault/widgets/vault_section.dart';
import '../widgets/welcome/actions_buttons.dart';
import '../widgets/welcome/check_box_section.dart';
import '../widgets/welcome/logo_titile_section.dart';
import '../widgets/welcome/progress_indicator.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
      backgroundColor: const Color(0xFFF7F1FF),
      body: SafeArea(
        child: SingleChildScrollView( // Envolva tudo em um SingleChildScrollView
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10.r,
                        offset: Offset(0, 4.h),
                      ),
                    ],
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LogoTitleSection(),
                      Divider(),
                      SizedBox(height: 16),
                      VaultSection(
                        svgPath: 'assets/icon/vault_ic.svg',
                      ),
                      SizedBox(height: 24),
                      ProgressIndicators(),
                      SizedBox(height: 24),
                      CheckboxSection(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                const ActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
