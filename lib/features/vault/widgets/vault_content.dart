import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import necessário para usar o GetX
import 'package:guarda_digital_flutter/features/vault/widgets/tab_view_content.dart';
import 'package:guarda_digital_flutter/features/vault/widgets/vault_section.dart';
import '../../account/controller/account_controller.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';

class VaultContent extends StatelessWidget {
  const VaultContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find<AccountController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RectangleButton(
          text: 'MEU COFRE',
          color: AppColors.pink,
          onPressed: () {},
        ),
        const VaultSection(
          title: 'Meu Cofre',
          description: 'Resumo de todas as informações do seu testamento digital',
          svgPath: 'assets/icon/vault_white_ic.svg',
          backgroundColor: AppColors.primary,
          titleFontSize: 22.0,
          descriptionFontSize: 14.0,
          iconColor: AppColors.background,
          height: 130,
          textColor: AppColors.background,
        ),
        SizedBox(height: 18.h),
        SizedBox(height: 12.h),
        // Adicionando o TabController para criar as abas
        DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.primary,
                tabs: [
                  Tab(text: 'Detalhes do Cofre'),
                  Tab(text: 'Testamento'),
                ],
              ),
              SizedBox(
                height: 400.h, // Define a altura do TabBarView
                child: TabViewContent(accountController: accountController),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
