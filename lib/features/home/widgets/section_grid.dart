import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'section_card.dart';

class SectionGrid extends StatelessWidget {
  const SectionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      childAspectRatio: 1.2,
      children: const [
        SectionCard(
          svgPath: 'assets/icon/calendar_ic.svg',
          title: 'Dia a Dia',
          description: 'Tenha acesso as suas informações diárias...',
        ),
        SectionCard(
          svgPath: 'assets/icon/memories_ic.svg',
          title: 'Memórias',
          description: 'Compartilhe suas memórias e lembranças...',
        ),
        SectionCard(
          svgPath: 'assets/icon/after_life_ic.svg',
          title: 'Pós-vida',
          description: 'Tudo referente a sua organização do pós-vida...',
        ),
        SectionCard(
          svgPath: 'assets/icon/pets_ic.svg',
          title: 'Pet',
          description: 'Cuidados com o seu PET...',
        ),
      ],
    );
  }
}
