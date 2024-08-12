import 'package:flutter/material.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';

class MyDocumentsHeader extends StatelessWidget {
  const MyDocumentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return RectangleButton(
      text: 'MEUS DOCUMENTOS',
      color: AppColors.pink,
      onPressed: () {},
    );
  }
}
