import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/after_life/widgets/my_wish_content_card.dart';
import '../../../core/widgets/rectangle_button.dart'; 
import '../../../styles.dart';

class MyWishPage extends StatelessWidget {
  const MyWishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground, // Define a cor de fundo da tela
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Define o espaçamento interno do corpo da página
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Botão retangular para ações relacionadas a "MEUS DESEJOS"
              RectangleButton(
                text: 'MEUS DESEJOS',
                color: AppColors.pink, // Define a cor do botão
                onPressed: () {
                  // Ação a ser executada quando o botão for pressionado
                },
              ),
              SizedBox(height: 16.h), // Espaçamento vertical entre o botão e o próximo conteúdo
              const MyWishContentCard(), // Widget personalizado que representa o conteúdo relacionado a "MEUS DESEJOS"
            ],
          ),
        ),
      ),
    );
  }
}
