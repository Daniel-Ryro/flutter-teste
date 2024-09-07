import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart'; // Import necessário para usar o GetX
import 'package:guarda_digital_flutter/features/vault/widgets/vault_sections.dart';
import '../../account/controller/account_controller.dart';
import 'beneficiaries_section.dart';
import 'executors_section.dart';
import 'mandatory_items_section.dart';
import 'history_section.dart';
import 'videos_section.dart';

class TabViewContent extends StatelessWidget {
  final AccountController accountController;

  const TabViewContent({super.key, required this.accountController});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        // Conteúdo da aba "Detalhes do Cofre"
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildVaultSections(),
              const Divider(thickness: 1.0),
              buildHistorySection(),
              const Divider(thickness: 1.0),
              SizedBox(height: 16.h),
              const MandatoryItemsSection(),
              const Divider(thickness: 1.0),
              SizedBox(height: 16.h),
              const VideosSection(),
            ],
          ),
        ),
        // Conteúdo da aba "Testamento"
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if (accountController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ExecutorsSection(executors: accountController.executors);
              }),
              SizedBox(height: 16.h),
              const BeneficiariesSection(),
            ],
          ),
        ),
      ],
    );
  }
}
