// daily_routine_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';
import '../../../styles.dart';
import '../widgets/health_tab_content.dart';
import '../widgets/my_accounts_tab_content.dart';
import '../widgets/my_documents_tab_content.dart';

class DailyRoutineScreen extends StatefulWidget {
  const DailyRoutineScreen({super.key});

  @override
  _DailyRoutineScreenState createState() => _DailyRoutineScreenState();
}

class _DailyRoutineScreenState extends State<DailyRoutineScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      appBar: const CustomAppBar(
        leftIconPath: 'assets/icon/loco_horizontal_ic.svg',
        iconPaths: [
          'assets/icon/notification_ic.svg',
          'assets/icon/help_ic.svg',
          'assets/icon/user_setting_ic.svg',
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabIconRow(
              icons: const [
                'assets/icon/heart_ic.svg',
                'assets/icon/file_ic.svg',
                'assets/icon/add_person_ic.svg',
              ],
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            SizedBox(height: 4.h),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const HealthTabContent(); 
      case 1:
        return const MyDocumentsTabContent();
      case 2:
        return const MyAccountsTabContent();
      default:
        return Container();
    }
  }
}
