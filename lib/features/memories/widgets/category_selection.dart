  import 'package:flutter/material.dart';
  import 'package:guarda_digital_flutter/styles.dart';
  import '../../../core/widgets/selection_section.dart';

  class CategorySelection extends StatelessWidget {
    const CategorySelection({super.key});

    @override
    Widget build(BuildContext context) {
      return SelectionSection(
        title: 'Selecione a categoria',
        options: const ['Todos', 'Vídeos', 'Documentos', 'Áudios', 'Imagens'],
        initialSelection: 'Todos',
        selectedColor: AppColors.pink,
        unselectedColor: Colors.grey[300],
        selectedTextColor: Colors.white,
        unselectedTextColor: AppColors.pink,
        borderColor: AppColors.primary,
      );
    }
  }
