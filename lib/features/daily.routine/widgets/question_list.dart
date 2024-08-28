import 'package:flutter/material.dart';
import 'question_card.dart';
import '../../../styles.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuestionCard(
          title: 'Decisões Médicas',
          subtitle: '7 perguntas',
          color: AppColors.background,
        ),
        QuestionCard(
          title: 'Doação de órgãos',
          subtitle: '2 perguntas',
          color: AppColors.background,
        ),
        QuestionCard(
          title: 'Representante legal',
          subtitle: 'Questões médicas',
          color: AppColors.background,
        ),
      ],
    );
  }
}
