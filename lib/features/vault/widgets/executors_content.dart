import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/features/vault/widgets/update_executor_form_modal.dart';
import 'package:guarda_digital_flutter/features/vault/widgets/vault_section.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'package:get/get.dart';
import '../../account/controller/account_controller.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../core/widgets/user_card_widget.dart';
import '../../account/data/models/executor_model.dart';
import 'add_executor_form_modal.dart';

class ExecutorsContent extends StatelessWidget {
  const ExecutorsContent({super.key});

  @override
  Widget build(BuildContext context) {
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
                  // Passa um novo executor vazio para adicionar
                  _showExecutorForm(context);
                },
                textColor: Colors.white,
                buttonColor: AppColors.pink,
                fontSize: 16.sp,
                borderRadius: 40.r,
                width: 180.0,
                height: 48.h,
              ),
            ),
          ),
        ),
        SizedBox(height: 18.h),
        Obx(() {
          if (accountController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (accountController.executors.isEmpty) {
            return const Center(child: Text('Nenhum executor encontrado.'));
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: accountController.executors.length,
            itemBuilder: (context, index) {
              final executor = accountController.executors[index];
              IconData? trailingIcon;
              if (executor.statusExecutorLabel == 'Accepted') {
                trailingIcon = Icons.check_circle;
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
                        color: Colors.green,
                      )
                    : null,
                onTap: () {
                  _showExecutorOptions(context, executor);
                },
              );
            },
          );
        }),
      ],
    );
  }

  // Método para abrir o formulário de adicionar executor
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
        // Passa um novo executor vazio para o modal de adicionar
        return ExecutorFormModal(
          executor: ExecutorModel(
            personId: 0,
            accountId: 0,
            firstName: '',
            middleName: '',
            lastName: '',
            cellPhone: '',
            email: '',
            birthDate: DateTime.now(),
            statusExecutorLabel: '',
            proofOfLifeStatusLabel: '',
          ),
          onSave: (newExecutor) {
            // Adicionando novo executor
            Get.find<AccountController>().addOrUpdateExecutor(newExecutor);
          },
        );
      },
    );
  }

  void _showEditExecutorForm(BuildContext context, ExecutorModel executor) {
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
        return UpdateExecutorFormModal(
          executor: executor,
          onSave: (updatedExecutor) {
            Get.find<AccountController>().addOrUpdateExecutor(updatedExecutor);
          },
        );
      },
    );
  }

  // Método para mostrar as opções do executor
  void _showExecutorOptions(BuildContext context, ExecutorModel executor) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Editar Executor'),
              onTap: () {
                Navigator.pop(context);
                _showEditExecutorForm(context, executor);
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Remover Executor'),
              onTap: () {
                Navigator.pop(context);
                _confirmDeleteExecutor(context, executor);
              },
            ),
          ],
        );
      },
    );
  }

  // Método para confirmar a remoção do executor
  void _confirmDeleteExecutor(BuildContext context, ExecutorModel executor) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Remoção'),
          content: const Text('Tem certeza de que deseja remover este executor?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Get.find<AccountController>().removeExecutor(executor.personId.toString());
                Navigator.of(context).pop();
              },
              child: const Text('Remover'),
            ),
          ],
        );
      },
    );
  }
}
