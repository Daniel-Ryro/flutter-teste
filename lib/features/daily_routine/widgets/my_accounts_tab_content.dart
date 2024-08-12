import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/daily_routine/widgets/my_accounts_header.dart';
import '../widgets/account_card.dart';
import '../widgets/account_item.dart';

class MyAccountsTabContent extends StatelessWidget {
  const MyAccountsTabContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
       const MyAccountsHeader(),
        SizedBox(height: 16.h),
        const AccountCard(),
        SizedBox(height: 12.h),
        const AccountItem(
          label: 'Redes Sociais',
          accountName: 'Instagram',
        ),
        SizedBox(height: 8.h),
        const AccountItem(
          label: 'Financeiro',
          accountName: 'Banco Santander',
        ),
        SizedBox(height: 8.h),
        const AccountItem(
          label: 'Apólices',
          accountName: 'Bradesco',
        ),
      ],
    );
  }
}
