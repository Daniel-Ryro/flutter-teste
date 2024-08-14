import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> iconPaths;
  final List<VoidCallback?> iconActions;

  const CustomAppBar({
    super.key,
    this.iconPaths = const [],
    this.iconActions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      leading: null, // Remove o ícone de "arrow back" e a logo à esquerda
      automaticallyImplyLeading: false, // Garante que nenhum ícone padrão será exibido
      actions: _buildAppBarIcons(),
    );
  }

  List<Widget> _buildAppBarIcons() {
    return List<Widget>.generate(iconPaths.length, (index) {
      return IconButton(
        icon: SvgPicture.asset(iconPaths[index], width: 24.w, height: 24.h),
        onPressed: iconActions.isNotEmpty && index < iconActions.length
            ? iconActions[index]
            : null,
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
