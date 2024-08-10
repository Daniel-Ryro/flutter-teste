import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../routes/app_routes.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.purple,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, AppRoutes.homeScreen);
            break;
          case 5:
            Navigator.pushNamed(context, AppRoutes.vaultScreen);
            break;
        }
      },
      items: [
        _buildBottomNavigationBarItem(
          svgPath: 'assets/icon/home_ic.svg',
          label: 'Início',
        ),
        _buildBottomNavigationBarItem(
          svgPath: 'assets/icon/calendar_ic.svg',
          label: 'Dia a Dia',
        ),
        _buildBottomNavigationBarItem(
          svgPath: 'assets/icon/memories_ic.svg',
          label: 'Memórias',
        ),
        _buildBottomNavigationBarItem(
          svgPath: 'assets/icon/after_life_ic.svg',
          label: 'Pós Vida',
        ),
        _buildBottomNavigationBarItem(
          svgPath: 'assets/icon/pets_ic.svg',
          label: 'PETs',
        ),
        _buildBottomNavigationBarItem(
          svgPath: 'assets/icon/vault_ic.svg',
          label: 'Cofre',
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String svgPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        width: 36.0, // Largura do círculo
        height: 36.0, // Altura do círculo
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.purpleAccent,
        ),
        child: SvgPicture.asset(
          svgPath,
          width: 20.0, // Tamanho do ícone SVG dentro do círculo
        ),
      ),
      label: label,
    );
  }
}
