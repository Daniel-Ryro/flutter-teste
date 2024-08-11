import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../core/widgets/list_item.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../widgets/vault_section.dart';

class VaultContent extends StatelessWidget {
  const VaultContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RectangleButton(
          text: 'MEU COFRE',
          color: AppColors.pink,
          onPressed: () {},
        ),
        SizedBox(height: 18.h),
        const VaultSection(
          title: 'Meu Cofre',
          description: 'Resumo de todas as informações do seu testamento digital',
          svgPath: 'assets/icon/vault_white_ic.svg',
          backgroundColor: AppColors.primary,
          titleFontSize: 22.0,
          descriptionFontSize: 14.0,
          iconColor: AppColors.background,
          textColor: AppColors.background,
        ),
        SizedBox(height: 18.h),
        _buildVaultSections(),
        SizedBox(height: 12.h),
        _buildHistorySection(),
        SizedBox(height: 16.h),
        _buildMandatoryItemsSection(),
      ],
    );
  }

  Widget _buildVaultSections() {
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
                child: const Text(
                  '1/6',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: VaultSection(
            title: 'Assinatura Digital',
            description: 'Clique no botão e assine digitalmente o seu testamento digital',
            svgPath: 'assets/icon/cadastrar_ic.svg',
            backgroundColor: AppColors.blackDefault,
            iconColor: AppColors.background,
            textColor: AppColors.background,
            titleFontSize: 14.0,
            descriptionFontSize: 12.0,
            width: 161.w,
            height: 180.h,
            actionWidget: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Flexible(
                        child: Text(
                          'CERTIFICADO DIGITAL',
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.background,
                        size: 16.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHistorySection() {
    return ListItem(
      text: 'histórico versão cofre',
      onTap: () {},
      boxDecorationColor: AppColors.background,
      fontSize: 16.sp,
      iconColor: Colors.black,
      iconSize: 24.sp,
      textColor: Colors.black,
    );
  }

  Widget _buildMandatoryItemsSection() {
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
