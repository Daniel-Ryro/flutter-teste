import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepresentativeInfoText extends StatelessWidget {
  const RepresentativeInfoText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quem você quer que seja seu Representante?',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Você quer que um beneficiários ou executor tenham a preferência de receber algum bem específico, como imóveis, carros, contas bancárias ou até mesmo uma plataforma digital que você monetiza? Se sim, adicione um bem específico por vez para um ou mais beneficiários ou executor da sua escolha.',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
