import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/after_life/widgets/title_section.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';
import '../../../styles.dart';
import '../widgets/agendamento_tab_content.dart';
import '../widgets/pet_card.dart';
import '../widgets/pet_tab_content.dart';

class PetsScreen extends StatefulWidget {
  const PetsScreen({super.key});

  @override
  _PetsScreenState createState() => _PetsScreenState();
}

class _PetsScreenState extends State<PetsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                  'assets/icon/pets_ic.svg',
                ],
                selectedIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
              ),
              SizedBox(height: 4.h),
              RectangleButton(
                text: 'PET',
                color: AppColors.pink,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              const PetCard(),
              SizedBox(height: 16.h),
              const TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4.0, color: AppColors.primary),
                  insets: EdgeInsets.symmetric(horizontal: 100.0),
                ),
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'Pets'),
                  Tab(text: 'Agendamentos'),
                ],
              ),
              SizedBox(
                height: 300.h,
                child: const TabBarView(
                  children: [
                    PetsTabContent(),
                    AgendamentoTabContent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
