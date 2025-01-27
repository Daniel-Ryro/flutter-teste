import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../widgets/conference_section.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';
import '../widgets/section_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      appBar: CustomAppBar(
        iconPaths: const [
          'assets/icon/notification_ic.svg',
          'assets/icon/help_ic.svg',
          'assets/icon/user_setting_ic.svg',
        ],
        iconActions: [
          () {
            Navigator.pushNamed(context, AppRoutes.notificationScreen);
          },
          () {
            Navigator.pushNamed(context, AppRoutes.helpScreen);
          },
          () {
            // Action for user settings icon
            Navigator.pushNamed(context, AppRoutes.userSettings);
            // Navigate to the user settings page
          },
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ConferenceSection(),
            SizedBox(height: 16.h),
            Text(
              'Seções',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            const SectionGrid(),
          ],
        ),
      ),
    );
  }
}
