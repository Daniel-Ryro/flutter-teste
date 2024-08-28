import 'package:flutter/material.dart';
import '../../../core/widgets/generic_header.dart';
import '../../../styles.dart';

class MyAccountsHeader extends StatelessWidget {
  const MyAccountsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericHeader(
      text: 'MINHAS CONTAS',
      backgroundColor: AppColors.pink,
      onPressed: () {},
    );
  }
}