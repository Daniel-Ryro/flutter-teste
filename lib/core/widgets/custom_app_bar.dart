import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.logoPath = 'assets/icon/loco_horizontal_ic.svg', // Caminho padrão para o logo
    this.actions = const [], // Ações padrão vazias
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(
        logoPath,
        height: 24.h,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
