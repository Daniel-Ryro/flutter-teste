import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../controllers/auth_controller.dart';
import '../widgets/login_header.dart';
import '../widgets/notification_button.dart';
import '../widgets/option_button.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Busca o controlador de autenticação usando o GetX.
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.onbackground, // Define a cor de fundo da tela.
      body: SafeArea(
        // O SafeArea evita que o conteúdo fique sobreposto ao notch, barras de status, etc.
        child: SingleChildScrollView(
          // Permite rolar o conteúdo da tela se ele for maior que a altura da tela.
          child: Center(
            child: Container(
              margin: EdgeInsets.all(
                  16.w), // Margem ao redor do container principal.
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo branca para o container.
                borderRadius:
                    BorderRadius.circular(8.r), // Bordas arredondadas.
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Sombra cinza com opacidade.
                    spreadRadius: 5.r, // Espalhamento da sombra.
                    blurRadius: 7.r, // Desfoque da sombra.
                    offset: Offset(0, 3.h), // Deslocamento da sombra.
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // O tamanho principal da coluna será o mínimo necessário.
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Alinha os itens ao centro horizontalmente.
                children: [
                  const LoginHeader(
                    // Componente personalizado para o cabeçalho de login.
                    containerHeight: 400.0,
                    gradientHeight: 150.0,
                    logoTopPosition: 220.0,
                    logoWidth: 150.0,
                  ),
                  SizedBox(
                      height: 24.h), // Espaço entre o cabeçalho e os botões.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: OptionButton(
                      text: S
                          .of(context)
                          .signIn, // Texto do botão, utilizando i18n.
                      onPressed: () async {
                        authController
                            .login(); // Chama o método de login do controlador de autenticação.
                      },
                      buttonColor: AppColors.primary, // Cor do botão.
                      textColor: Colors.white, // Cor do texto do botão.
                    ),
                  ),
                  SizedBox(height: 16.h), // Espaço entre os botões.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: OptionButton(
                      text: S
                          .of(context)
                          .signUp, // Texto do botão, utilizando i18n.
                      onPressed: () {
                        Navigator.pushNamed(
                            context,
                            AppRoutes
                                .signUpScreen); // Navega para a tela de cadastro.
                      },
                      buttonColor: AppColors.pink, // Cor do botão.
                      textColor: AppColors.onPrimary, // Cor do texto do botão.
                      iconPath:
                          'assets/icon/cadastrar_ic.svg', // Caminho do ícone do botão.
                    ),
                  ),
                  SizedBox(
                      height: 32
                          .h), // Espaço entre os botões e o texto informativo.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text:
                            '${S.of(context).uAre} ', // Texto inicial do RichText.
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: S
                                .of(context)
                                .executor, // Texto em negrito, usando i18n.
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextSpan(
                              text: ' ${S.of(context).or} '), // Texto "ou".
                          TextSpan(
                            text: S
                                .of(context)
                                .beneficiary, // Texto em negrito, usando i18n.
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' ${S.of(context).clickBelow}', // Texto final do RichText.
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 16
                          .h), // Espaço entre o texto e o botão de notificação.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child:
                        const NotificationButton(), // Botão de notificação personalizado.
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
