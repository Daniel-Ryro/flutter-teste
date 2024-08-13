import 'package:flutter/material.dart';
import '../../../core/widgets/generic_header.dart';
import '../../../styles.dart';

class HealthHeaderSection extends StatelessWidget {
  const HealthHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericHeader(
      text: 'SAÚDE',
      backgroundColor: AppColors.pink,
      onPressed: () {},
    );
  }
}