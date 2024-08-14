import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_infos_tab/user_settings_my_infos_content.dart';

import '../contact_tab/list_contact.dart';
import '../family_setting_tab/user_settings_family_settings_content.dart';
import '../my_plans_tab/user_settings_my_plan_content.dart';


class UserSettingsContent extends StatelessWidget {
  final int selectedIndex;

  const UserSettingsContent({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const UserSettingsMyInfos();
      case 1:
        return const UserSettingsMyPlan();
      case 2:
        return const UserSettingsFamilySetting();
      case 3:
        return const UserSettingsContact();
      default:
        return const Text('padrao');
    }
  }
}
