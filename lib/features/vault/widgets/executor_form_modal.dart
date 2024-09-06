import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../styles.dart';
import '../../account/data/models/executor_model.dart';
import 'package:intl/intl.dart'; // Pacote para formatação de datas

class ExecutorFormModal extends StatelessWidget {
  final ExecutorModel executor;
  final Function(ExecutorModel) onSave;

  ExecutorFormModal({
    Key? key,
    required this.executor,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController =
        TextEditingController(text: executor.firstName);
    final TextEditingController middleNameController =
        TextEditingController(text: executor.middleName);
    final TextEditingController lastNameController =
        TextEditingController(text: executor.lastName);
    final TextEditingController emailController =
        TextEditingController(text: executor.email);
    final TextEditingController cellPhoneController =
        TextEditingController(text: executor.cellPhone);

    // Formatação da data
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final TextEditingController birthDateController = TextEditingController(
      text: executor.birthDate != null
          ? dateFormat.format(executor.birthDate)
          : '',
    );

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16.h,
        left: 16.w,
        right: 16.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header da modal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Adicionar Executores',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'Primeiro Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: middleNameController,
              decoration: InputDecoration(
                labelText: 'Segundo Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Último Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: birthDateController,
              decoration: InputDecoration(
                labelText: 'Data Nascimento',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  birthDateController.text = dateFormat.format(pickedDate);
                }
              },
            ),
            SizedBox(height: 12.h),
            TextField(
              controller: cellPhoneController,
              decoration: InputDecoration(
                labelText: 'Celular',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            ActionButton(
              text: 'Inserir Foto',
              onPressed: () {
                // Função para inserir foto
              },
              textColor: AppColors.background,
              buttonColor: AppColors.pink,
              fontSize: 14.sp,
              borderRadius: 10.r,
              width: double.infinity,
              height: 45.h,
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  text: 'Cancelar',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  textColor: AppColors.primary,
                  buttonColor: AppColors.background,
                  fontSize: 14.sp,
                  borderRadius: 10.r,
                  width: 110.w,
                  height: 45.h,
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2.0),
                ),
                ActionButton(
                  text: 'Salvar',
                  onPressed: () {
                    try {
                      // Converte a data para o formato DateTime antes de enviar para a API
                      DateTime birthDate = dateFormat.parse(birthDateController.text);

                      ExecutorModel newExecutor = ExecutorModel(
                        personId: 0,
                        accountId: 0,
                        firstName: firstNameController.text,
                        middleName: middleNameController.text,
                        lastName: lastNameController.text,
                        cellPhone: cellPhoneController.text,
                        email: emailController.text,
                        birthDate: birthDate,
                        statusExecutorLabel: '',
                        proofOfLifeStatusLabel: '',
                      );

                      onSave(newExecutor);
                      Navigator.of(context).pop();
                    } catch (e) {
                      print('Erro ao converter a data: $e');
                      // Mostra uma mensagem de erro ou um alerta se a conversão falhar
                    }
                  },
                  textColor: AppColors.background,
                  buttonColor: AppColors.pink,
                  fontSize: 14.sp,
                  borderRadius: 10.r,
                  width: 110.w,
                  height: 45.h,
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 2.0),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
