import 'package:flutter/material.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';

class MyAccountsHeader extends StatelessWidget {
  const MyAccountsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangleButton(
      text: 'MINHAS CONTAS',
      color: AppColors.pink,
      onPressed: () {},
    );
  }
}
