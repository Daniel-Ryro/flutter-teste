import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:guarda_digital_flutter/features/vault/widgets/beneficiary_content.dart';
import 'package:guarda_digital_flutter/features/vault/widgets/vault_content.dart';
import 'package:guarda_digital_flutter/features/vault/widgets/executors_content.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/tab_icon_row_widget.dart';
import '../../../routes/app_routes.dart';
import '../../account/controller/account_controller.dart';

class VaultScreen extends StatefulWidget {
  const VaultScreen({super.key});

  @override
  _VaultScreenState createState() => _VaultScreenState();
}

class _VaultScreenState extends State<VaultScreen> {
  final AccountController accountController = Get.find<AccountController>();
  int _selectedTabIndex = 0;

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
            Get.toNamed(AppRoutes.notificationScreen);
          },
          () {
            Get.toNamed(AppRoutes.helpScreen);
          },
          () {
            Get.toNamed(AppRoutes.userSettings);
          },
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
            SizedBox(height: 10.h),
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
