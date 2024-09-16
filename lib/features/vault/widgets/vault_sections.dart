import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';
import 'vault_section.dart';

Widget buildVaultSections() {
  return Row(
    children: [
      Expanded(
        child: VaultSection(
          title: 'Versão Cofre',
          description: 'Clique no botão para ver o histórico das versões',
          svgPath: 'assets/icon/version_ic.svg',
          backgroundColor: AppColors.pink,
          iconColor: AppColors.background,
          textColor: AppColors.background,
          titleFontSize: 14.0,
          descriptionFontSize: 12.0,
          width: 161.w,
          height: 180.h,
          actionWidget: Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Text(
                '1/6',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 8.w),
      Expanded(
        child: VaultSection(
          title: 'Assinatura Digital',
          description:
              'Clique no botão e assine digitalmente o seu testamento digital',
          svgPath: 'assets/icon/cadastrar_ic.svg',
          backgroundColor: AppColors.blackDefault,
          iconColor: AppColors.background,
          textColor: AppColors.background,
          titleFontSize: 14.0,
          descriptionFontSize: 12.0,
          width: 161.w,
          height: 180.h,
        ),
      ),
    ],
  );
}
