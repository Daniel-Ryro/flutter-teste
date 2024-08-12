import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/assets_estate_content.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/farewell_content.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/my_wish_content.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/tribute_content.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';
import '../../../styles.dart';

class AfterLifeScreen extends StatefulWidget {
  const AfterLifeScreen({super.key});

  @override
  _AfterLifeScreenState createState() => _AfterLifeScreenState();
}

class _AfterLifeScreenState extends State<AfterLifeScreen> {
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: TabIconRow(
              icons: const [
                'assets/icon/money_file_ic.svg',
                'assets/icon/file_file_ic.svg',
                'assets/icon/fire_ic.svg',
                'assets/icon/heart_favorite_ic.svg',
              ],
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedTabIndex) {
      case 0:
        return const AssetsEstateContent();
      case 1:
        return const TributeContent();
      case 2:
        return const FarewellContent();
      case 3:
        return const MyWishContent();
      default:
        return const AssetsEstateContent();
    }
  }
}
