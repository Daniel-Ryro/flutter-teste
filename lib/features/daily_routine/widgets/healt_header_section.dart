import 'package:flutter/material.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangleButton(
      text: 'SAÚDE',
      color: AppColors.pink,
      onPressed: () {},
    );
  }
}
