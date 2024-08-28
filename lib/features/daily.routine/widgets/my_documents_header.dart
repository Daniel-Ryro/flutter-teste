import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/core/widgets/generic_header.dart';
import '../../../styles.dart';


class MyDocumentsHeader extends StatelessWidget {
  const MyDocumentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericHeader(
      text: 'MEUS DOCUMENTOS',
      backgroundColor: AppColors.pink,
      onPressed: () {},
    );
  }
}
