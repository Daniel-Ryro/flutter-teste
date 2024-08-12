import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'package:guarda_digital_flutter/features/vault/presentation/beneficiary_content.dart';
import 'package:guarda_digital_flutter/features/vault/presentation/vault_content.dart';
import 'package:guarda_digital_flutter/features/vault/presentation/executors_content.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  _VaultScreenState createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
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
                'assets/icon/vault_ic.svg',
                'assets/icon/comunity_ic.svg',
                'assets/icon/persons_ic.svg',
              ],
              selectedIndex: _selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            ),
            SizedBox(height: 24.h),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedTabIndex) {
      case 1:
        return const ExecutorsContent();
      case 2:
        return const BeneficiaryContent();
      default:
        return const VaultContent();
    }
  }
}
