import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'package:get/get.dart'; // Import GetX para usar o controlador
import '../../account/controller/account_controller.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../core/widgets/user_card_widget.dart';
import '../widgets/vault_section.dart';
import 'executor_form_modal.dart'; // Importe o widget do formulário de executor

class ExecutorsContent extends StatelessWidget {
  const ExecutorsContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Instância do controlador de conta
    final AccountController accountController = Get.find<AccountController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RectangleButton(
          text: 'EXECUTORES',
          color: AppColors.pink,
          onPressed: () {},
        ),
        SizedBox(height: 18.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: VaultSection(
            title: 'Executores',
            description:
                'Escolha quem irá gerenciar e distribuir seus ativos e contas digitais após sua partida.',
            backgroundColor: AppColors.background,
            iconColor: AppColors.blackDefault,
            textColor: AppColors.blackDefault,
            titleFontSize: 18.0,
            descriptionFontSize: 16.0,
            actionWidget: Align(
              alignment: Alignment.center,
              child: ActionButton(
                icon: SvgPicture.asset(
                  'assets/icon/add_ic.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                text: 'Adicionar',
                onPressed: () {
                  _showExecutorForm(context);
                },
                textColor: Colors.white,
                buttonColor: AppColors.pink,
                fontSize: 16.sp,
                borderRadius: 40.r,
                width: 160.0,
                height: 48.h,
              ),
            ),
          ),
        ),
        SizedBox(height: 18.h),
        // Use Obx para escutar mudanças na lista de executores
        Obx(() {
          if (accountController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (accountController.executors.isEmpty) {
            return const Center(child: Text('Nenhum executor encontrado.'));
          }
          // Renderiza a lista de executores
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: accountController.executors.length,
            itemBuilder: (context, index) {
              final executor = accountController.executors[index];
              
              // Define o ícone apenas se o status for "Accepted"
              IconData? trailingIcon;
              if (executor.statusExecutorLabel == 'Accepted') {
                trailingIcon = Icons.check_circle; // Ícone de confirmação
              }

              return CompactUserCard(
                name: '${executor.firstName} ${executor.lastName}',
                email: executor.email,
                avatarColor: AppColors.pink,
                iconSize: 50.0,
                avatarRadius: 30.0,
                trailingIcon: trailingIcon != null
                    ? Icon(
                        trailingIcon,
                        color: Colors.green, // Cor verde para ícone de confirmação
                      )
                    : null, // Não exibe nenhum ícone se não for "Accepted"
                onTap: () {
                  // Handle card tap
                },
              );
            },
          );
        }),
      ],
    );
  }

  void _showExecutorForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return const ExecutorFormModal();
      },
    );
  }
}
