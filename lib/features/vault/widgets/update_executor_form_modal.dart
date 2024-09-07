import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../styles.dart';
import '../../account/data/models/executor_model.dart';

class UpdateExecutorFormModal extends StatelessWidget {
  final ExecutorModel executor;
  final Function(ExecutorModel) onSave;

  const UpdateExecutorFormModal({
    super.key,
    required this.executor,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController =
        TextEditingController(text: executor.firstName);
    final TextEditingController lastNameController =
        TextEditingController(text: executor.lastName);
    final TextEditingController emailController =
        TextEditingController(text: executor.email);

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
                  'Editar Executor',
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
                labelText: 'Nome',
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
                  borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
                ),
                ActionButton(
                  text: 'Salvar',
                  onPressed: () {
                    ExecutorModel updatedExecutor = executor.copyWith(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                    );

                    onSave(updatedExecutor);
                    Navigator.of(context).pop();
                  },
                  textColor: AppColors.background,
                  buttonColor: AppColors.pink,
                  fontSize: 14.sp,
                  borderRadius: 10.r,
                  width: 110.w,
                  height: 45.h,
                  borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
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
