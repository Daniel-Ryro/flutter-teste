import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/selection_section.dart';
import '../../../styles.dart';

class FuneralTypeSection extends StatelessWidget {
  const FuneralTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectionSection(
      title: 'Tipo de funeral',
      options: [
        'Não definido',
        'Tradicional',
        'Crematório',
        'Mausoléu',
        'Memorial',
        'Sepulamento verde',
      ],
      initialSelection: 'Não definido',
    );
  }
}
