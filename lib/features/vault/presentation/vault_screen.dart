import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/features/vault/presentation/beneficiary_content.dart';
import 'package:guarda_digital_flutter/features/vault/presentation/vault_content.dart';
import 'package:guarda_digital_flutter/features/vault/presentation/executors_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../core/widgets/icon_rounded_button.dart';

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
      appBar: CustomAppBar(
        actions: _buildAppBarActions(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIconButtonsRow(),
            SizedBox(height: 4.h),
            _buildContent(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 5),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      _buildAppBarIcon('assets/icon/notification_ic.svg'),
      _buildAppBarIcon('assets/icon/help_ic.svg'),
      _buildAppBarIcon('assets/icon/user_setting_ic.svg'),
    ];
  }

  Widget _buildAppBarIcon(String svgPath) {
    return IconButton(
      icon: SvgPicture.asset(svgPath, width: 24.w, height: 24.h),
      onPressed: () {},
    );
  }

  Widget _buildIconButtonsRow() {
    return Row(
      children: [
        _buildIconButton('assets/icon/vault_ic.svg', 0),
        SizedBox(width: 10.w),
        _buildIconButton('assets/icon/comunity_ic.svg', 1),
        SizedBox(width: 10.w),
        _buildIconButton('assets/icon/persons_ic.svg', 2),
      ],
    );
  }

  Widget _buildIconButton(String svgPath, int index) {
    return IconRoundedButton(
      svgPath: svgPath,
      color: _selectedTabIndex == index ? AppColors.pink : AppColors.primary,
      onPressed: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      width: 64.w,
      height: 64.h,
      iconSize: 36.sp,
      iconColor: Colors.white,
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
