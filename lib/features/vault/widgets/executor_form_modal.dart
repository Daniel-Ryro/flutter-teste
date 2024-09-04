import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../core/widgets/action_button_widget.dart';

class ExecutorFormModal extends StatelessWidget {
  const ExecutorFormModal({super.key});

  @override
  Widget build(BuildContext context) {
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
            // Formulário
            TextField(
              decoration: InputDecoration(
                labelText: 'Primeiro Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'Segundo Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'Último Nome',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
                prefixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              decoration: InputDecoration(
                labelText: 'Celular',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            ActionButton(
              text: 'Inserir Foto',
              onPressed: () {},
              textColor: Colors.white,
              buttonColor: AppColors.pink,
              fontSize: 14.sp,
              borderRadius: 20.r,
              width: 350.w,
              height: 45.h,
              icon: const Icon(
                Icons.file_upload_outlined,
                color: AppColors.background,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ActionButton(
                  text: 'Cancelar',
                  onPressed: () {
                    Navigator.of(context)
                        .pop(); // Fecha a modal ao clicar no botão "Cancelar"
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
                    // Lógica para salvar os dados
                    Navigator.of(context).pop();
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
