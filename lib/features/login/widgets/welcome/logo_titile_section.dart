import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';

class LogoTitleSection extends StatelessWidget {
  const LogoTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento dos textos à esquerda
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/icon/logo_horizontal_ic.svg',
            width: 200.w, // Ajuste o tamanho conforme necessário
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Olá, Joaquim,\nSeja - bem vindo(a)',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Agora você faz parte da família Guarda digital veja um pouco do que você vai encontrar.',
          style: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xFF7B7B7B),
          ),
        ),
      ],
    );
  }
}
