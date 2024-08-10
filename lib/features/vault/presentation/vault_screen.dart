import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../widgets/vault_section.dart';

class VaultScreen extends StatelessWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        actions: [
          // Adicione as ações da AppBar aqui, se necessário
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CofreSection(
              title: 'Meu Cofre',
              description: 'Resumo de todas as informações do seu testamento digital',
              svgPath: 'assets/icon/vault_ic.svg',
            ),
            SizedBox(height: 16.h),
            CofreSection(
              title: 'Versão Cofre',
              description: 'Clique no botão para ver o histórico das versões',
              svgPath: 'assets/icon/version_ic.svg',
              actionWidget: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Text(
                  '1/6',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CofreSection(
              title: 'Assinatura Digital',
              description: 'Clique no botão e assine digitalmente o seu testamento digital',
              svgPath: 'assets/icon/signature_ic.svg',
              actionWidget: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Text(
                  'CERTIFICADO DIGITAL',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CofreSection(
              title: 'Itens obrigatórios',
              description: 'Esses itens são obrigatórios para gerar o cofre',
              svgPath: 'assets/icon/mandatory_ic.svg',
              actionWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMandatoryItem('Meu perfil'),
                  SizedBox(height: 8.h),
                  _buildMandatoryItem('Executores'),
                ],
              ),
            ),
            // Adicione mais CofreSections conforme necessário
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 5),
    );
  }

  Widget _buildMandatoryItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        Icon(Icons.check_circle, color: Colors.green, size: 20.sp),
      ],
    );
  }
}
