import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../styles.dart';
import '../widgets/after_life_content.dart';
import '../widgets/after_life_tab_bar.dart';


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
          AfterLifeTabBar(
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          Expanded(
            child: AfterLifeContent(selectedIndex: _selectedTabIndex),
          ),
        ],
      ),
    );
  }
}
