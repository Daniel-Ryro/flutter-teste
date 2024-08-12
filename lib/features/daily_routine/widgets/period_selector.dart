import 'package:flutter/material.dart';
import '../../../styles.dart';
import '../../../core/widgets/selection_section.dart';

class PeriodSelection extends StatelessWidget {
  const PeriodSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectionSection(
      title: 'Prova de vida',
      options: ['Mensal', 'Bimestral', 'Semestral', 'Anual'],
      initialSelection: 'Mensal',
      selectedColor: AppColors.pink,
      unselectedColor: Colors.white,
      selectedTextColor: Colors.white,
      unselectedTextColor: AppColors.pink,
      borderColor: AppColors.pink,
    );
  }
}
