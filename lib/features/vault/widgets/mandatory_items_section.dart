import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../../core/widgets/list_item.dart';

class MandatoryItemsSection extends StatelessWidget {
  const MandatoryItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Itens obrigatórios',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Esses itens são obrigatórios para gerar o cofre',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 12.h),
        ListItem(
          text: 'Meu perfil',
          onTap: () {},
          boxDecorationColor: AppColors.background,
          fontSize: 14.sp,
          iconColor: AppColors.blackDefault,
          iconSize: 24.sp,
          textColor: AppColors.blackDefault,
          bold: true,
        ),
        ListItem(
          text: 'Executores',
          onTap: () {},
          boxDecorationColor: AppColors.background,
          fontSize: 14.sp,
          iconColor: AppColors.blackDefault,
          iconSize: 24.sp,
          textColor: AppColors.blackDefault,
          bold: true,
        ),
      ],
    );
  }
}
