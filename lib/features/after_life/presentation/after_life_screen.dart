import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../styles.dart'; 
import '../widgets/after_life_content.dart';
import '../widgets/after_life_tab_bar.dart';

class AfterLifeScreen extends StatefulWidget {
  const AfterLifeScreen({super.key});

  @override
  _AfterLifeScreenState createState() => _AfterLifeScreenState();
}

class _AfterLifeScreenState extends State<AfterLifeScreen> {
  int _selectedTabIndex = 0; // Índice da aba selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground, // Define a cor de fundo da tela
      appBar: const CustomAppBar(
        iconPaths: [
          'assets/icon/notification_ic.svg',
          'assets/icon/help_ic.svg',
          'assets/icon/user_setting_ic.svg',
        ], // Ícones que aparecerão no AppBar
      ),
      body: Column(
        children: [
          // Barra de abas personalizada para selecionar o conteúdo
          AfterLifeTabBar(
            selectedIndex: _selectedTabIndex, // Índice atual da aba selecionada
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index; // Atualiza a aba selecionada
              });
            },
          ),
          // Exibe o conteúdo correspondente à aba selecionada
          Expanded(
            child: AfterLifeContent(selectedIndex: _selectedTabIndex),
          ),
        ],
      ),
    );
  }
}
