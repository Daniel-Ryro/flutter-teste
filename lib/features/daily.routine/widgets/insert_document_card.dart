import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/widgets/form_widget.dart';
import '../../../styles.dart';
import '../../../core/widgets/action_button_widget.dart';

class InsertDocumentCard extends StatelessWidget {
  const InsertDocumentCard({super.key});

  void _showExecutorForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ExecutorForm(
            title: 'Adicionar Documento',
            dropdownLabel: 'Selecione o tipo',
            dropdownItems: const ['RG', 'CPF', 'CNH'],
            selectedDropdownItem: 'RG',
            onDropdownChanged: (value) {
              print('Selected document type: $value');
            },
            birthDateLabel: 'Data expiração',
            saveButtonText: 'Salvar',
            cancelButtonText: 'Cancelar',
            onSave: () {
              Navigator.of(context).pop();
            },
            onCancel: () {
              Navigator.of(context).pop();
            },
            onInsertPhoto: () {},
            insertPhotoLabel: 'Tirar foto',
            insertPhotoColor: Colors.purpleAccent,
            insertPhotoTextColor: Colors.white,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meu Documentos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: AppColors.blackDefault,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Insira os seus principais documentos',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: ActionButton(
                text: 'Inserir Documento',
                onPressed: () => _showExecutorForm(context),
                textColor: Colors.white,
                buttonColor: AppColors.pink,
                fontSize: 14.sp,
                borderRadius: 20.r,
                width: 245.w,
                height: 45.h,
                icon: SvgPicture.asset(
                  'assets/icon/add_ic.svg',
                  width: 21.w,
                  height: 24.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
