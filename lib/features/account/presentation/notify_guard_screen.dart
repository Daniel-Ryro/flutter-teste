import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart'; 

import '../../../core/widgets/rectangle_card.dart';
import '../../../generated/l10n.dart'; 
import '../../../routes/app_routes.dart';
import '../widgets/access_description.dart'; 
import '../widgets/login_header.dart'; 

class LoginExecuteScreen extends StatelessWidget {
  const LoginExecuteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground, // Define a cor de fundo da tela.
      body: SafeArea(
        // Garante que o conteúdo da tela não fique sobreposto por elementos do sistema, como o notch ou a barra de status.
        child: SingleChildScrollView(
          // Permite que o conteúdo seja rolado se exceder a altura da tela.
          child: Center(
            child: Container(
              margin: EdgeInsets.all(16.w), // Define a margem ao redor do container principal.
              decoration: BoxDecoration(
                color: Colors.white, // Define a cor de fundo do container.
                borderRadius: BorderRadius.circular(8.r), // Define as bordas arredondadas do container.
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Define a cor da sombra com opacidade.
                    spreadRadius: 5.r, // Define a propagação da sombra.
                    blurRadius: 7.r, // Define o raio de desfoque da sombra.
                    offset: Offset(0, 3.h), // Define o deslocamento da sombra.
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Define que a altura da coluna será o mínimo necessário.
                crossAxisAlignment: CrossAxisAlignment.center, // Alinha os itens ao centro horizontalmente.
                children: [
                  const LoginHeader(
                    // Componente personalizado para o cabeçalho de login.
                    containerHeight: 350.0,
                    gradientHeight: 120.0,
                    logoTopPosition: 180.0,
                    logoWidth: 130.0,
                  ),
                  SizedBox(height: 24.h), // Espaço entre o cabeçalho e o texto.
                  Text(
                    S.of(context).accessArea, // Texto do título, utilizando i18n.
                    style: TextStyle(
                      fontSize: 24.sp, // Define o tamanho da fonte.
                      fontWeight: FontWeight.bold, // Define o peso da fonte como negrito.
                      color: Colors.black, // Define a cor do texto.
                    ),
                  ),
                  SizedBox(height: 16.h), // Espaço entre o título e a descrição.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const AccessDescription(), // Widget personalizado que exibe a descrição de acesso.
                  ),
                  SizedBox(height: 24.h), // Espaço entre a descrição e o card.
                  CofreCard(
                    // Widget personalizado para o card de acesso.
                    title: S.of(context).accessKey, // Título do card, utilizando i18n.
                    backgroundColor: AppColors.pink, // Define a cor de fundo do card.
                    width: double.infinity, // O card ocupa toda a largura disponível.
                    height: 220.h, // Define a altura do card.
                    titleFontSize: 16.0.sp, // Define o tamanho da fonte do título.
                    bold: true, // Define o texto do título como negrito.
                    buttonText: S.of(context).access, // Texto do botão, utilizando i18n.
                    onButtonPressed: () {
                      Navigator.pushNamed(context, AppRoutes.homeScreen); // Navega para a tela inicial ao pressionar o botão.
                    },
                    buttonColor: AppColors.primary, // Define a cor do botão.
                    buttonTextColor: Colors.white, // Define a cor do texto do botão.
                    buttonFontSize: 16.0.sp, // Define o tamanho da fonte do botão.
                    buttonWidth: 360.w, // Define a largura do botão.
                    buttonBorderRadius: 8.0.r, // Define o raio de borda do botão.
                    onTextFieldChanged: (value) {}, // Função callback para o campo de texto.
                    description: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: S.of(context).enterAccessKeyPart1), // Texto da descrição, utilizando i18n.
                            TextSpan(
                              text: S.of(context).enterAccessKeyPart2,
                              style: const TextStyle(fontWeight: FontWeight.bold), // Parte do texto em negrito.
                            ),
                            TextSpan(text: S.of(context).enterAccessKeyPart3), // Continuação do texto da descrição.
                            TextSpan(
                              text: S.of(context).enterAccessKeyPart4,
                              style: const TextStyle(fontWeight: FontWeight.bold), // Parte do texto em negrito.
                            ),
                            TextSpan(text: S.of(context).enterAccessKeyPart5), // Final do texto da descrição.
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h), // Espaço final na parte inferior.
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
