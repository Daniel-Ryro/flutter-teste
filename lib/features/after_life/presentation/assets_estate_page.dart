import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/after_life/widgets/asset_estate_card.dart';
import '../../../core/widgets/rectangle_button.dart'; 
import '../../../styles.dart'; 

class AssetsEstatePage extends StatelessWidget {
  const AssetsEstatePage({super.key});

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
              // Botão retangular para ações relacionadas a "BENS E PATRIMÔNIO"
              RectangleButton(
                text: 'BENS E PATRIMÔNIO',
                color: AppColors.pink, // Define a cor do botão
                onPressed: () {
                  // Ação a ser executada quando o botão for pressionado
                },
              ),
              SizedBox(height: 16.h), // Espaçamento vertical entre o botão e o próximo conteúdo
              const ContentCard(), // Widget personalizado que representa o conteúdo relacionado a "BENS E PATRIMÔNIO"
            ],
          ),
        ),
      ),
    );
  }
}
