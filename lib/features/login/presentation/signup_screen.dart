import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/di/injection.dart'; 
import '../controllers/auth_controller.dart'; 
import '../../../core/widgets/action_button_widget.dart';
import '../../../generated/l10n.dart'; 
import '../../../styles.dart';
import '../widgets/back_button_row.dart';
import '../widgets/text_input_field.dart'; 

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key}) {
    // Usa GetX para registrar o AuthController de forma lazy (somente quando necessário)
    Get.lazyPut(() => sl<AuthController>());
  }

  @override
  Widget build(BuildContext context) {
    // Obtém uma instância do AuthController que foi registrada anteriormente
    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.background, // Define a cor de fundo da tela
      body: SingleChildScrollView(
        // Permite rolar o conteúdo se necessário
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Alinha os elementos à esquerda
            children: [
              SizedBox(height: 20.h), // Espaço vazio para espaçamento vertical
              const BackButtonRow(), // Widget personalizado que adiciona um botão de voltar
              SizedBox(height: 40.h), // Mais espaço para separar os elementos
              Center(
                // Centraliza os widgets filhos
                child: Column(
                  children: [
                    // Logo SVG
                    SvgPicture.asset(
                      'assets/icon/guarda_logo_ic.svg',
                      width: 198.w, // Define a largura da logo
                      colorFilter: const ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ), // Aplica uma cor à logo
                    ),
                    SizedBox(height: 16.h), // Espaçamento abaixo da logo
                    Text(
                      S.of(context).userDetails, // Texto de título utilizando i18n
                      style: TextStyle(
                        fontSize: 24.sp, // Tamanho da fonte ajustado para tela
                        fontWeight: FontWeight.bold, // Texto em negrito
                        color: Colors.black, // Cor do texto
                      ),
                    ),
                    SizedBox(height: 40.h), // Espaço entre o título e o primeiro campo de texto
                    TextInputField(
                      // Campo de texto personalizado para email
                      labelText: S.of(context).emailAddress, // Label do campo utilizando i18n
                      isObscure: false, // Campo de texto não é obscuro (não é uma senha)
                      onChanged: (value) => authController.email.value = value, // Atualiza o valor no controller
                    ),
                    SizedBox(height: 20.h), // Espaço entre os campos de texto
                    ActionButton(
                      // Botão para enviar o código de verificação
                      text: S.of(context).sendVerificationCode, // Texto do botão utilizando i18n
                      onPressed: () {
                        // Implementação para enviar o código de verificação, se necessário
                      },
                      buttonColor: AppColors.sendCode, // Cor do botão
                      textColor: Colors.white, // Cor do texto do botão
                      fontSize: 16.sp, // Tamanho da fonte do texto do botão
                      borderRadius: 8.r, // Raio de borda do botão
                      borderColor: Colors.transparent, // Cor da borda do botão (transparente)
                      width: 230.w, // Largura do botão
                      isBold: false, // Texto do botão não é negrito
                    ),
                    SizedBox(height: 20.h), // Espaço entre os elementos
                    TextInputField(
                      // Campo de texto personalizado para a nova senha
                      labelText: S.of(context).newPassword, // Label do campo utilizando i18n
                      isObscure: true, // Campo de texto é obscuro (senha)
                      onChanged: (value) => authController.password.value = value, // Atualiza o valor no controller
                    ),
                    SizedBox(height: 20.h), // Espaço entre os elementos
                    TextInputField(
                      // Campo de texto personalizado para confirmação da nova senha
                      labelText: S.of(context).confirmNewPassword, // Label do campo utilizando i18n
                      isObscure: true, // Campo de texto é obscuro (senha)
                    ),
                    SizedBox(height: 40.h), // Espaço antes do botão de criação de conta
                    ActionButton(
                      // Botão para criar a conta
                      text: S.of(context).create, // Texto do botão utilizando i18n
                      onPressed: () {
                        authController.signUp(); // Chama o método de criação de conta no controller
                      },
                      buttonColor: AppColors.sendCode, // Cor do botão
                      textColor: Colors.white, // Cor do texto do botão
                      fontSize: 16.sp, // Tamanho da fonte do texto do botão
                      borderRadius: 8.r, // Raio de borda do botão
                      borderColor: Colors.transparent, // Cor da borda do botão (transparente)
                      width: 200.w, // Largura do botão
                      isBold: false, // Texto do botão não é negrito
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
