import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/memories/presentation/memory_book_content.dart';
import 'package:guarda_digital_flutter/features/memories/presentation/my_files_tab_content.dart';
import 'package:guarda_digital_flutter/features/memories/presentation/time_capsule_tab_content.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';
import '../../../styles.dart';

class MemoriesScreen extends StatefulWidget {
  const MemoriesScreen({super.key});

  @override
  _MemoriesScreenState createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      appBar: const CustomAppBar(
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
                'assets/icon/person_memories_ic.svg',
                'assets/icon/file_memories_ic.svg',
                'assets/icon/timer_ic.svg',
              ],
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            SizedBox(height: 16.h),
            _buildContentForTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentForTab() {
    switch (_selectedTabIndex) {
      case 0:
        return const MemoryBookTabContent();
      case 1:
        return const MyFilesTabContent();
     case 2:
        return const TimeCapsuleTabContent();
      default:
        return const MemoryBookTabContent();
    }
  }
}
