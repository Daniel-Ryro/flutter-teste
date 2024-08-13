import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../../../styles.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key});

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
              'Minhas Contas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: AppColors.blackDefault,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Cadastre suas contas e as categorize',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.blackDefault,
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: ActionButton(
                text: 'ADICIONAR',
                onPressed: () {
                  _showAddAccountForm(context);
                },
                textColor: Colors.white,
                buttonColor: AppColors.pink,
                fontSize: 14.sp,
                borderRadius: 30.r,
                width: 170.w,
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

  void _showAddAccountForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Adicionar Contas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.blackDefault,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Selecione a categoria',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.blackDefault,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCategoryChip(
                          context, 'Redes Sociais', AppColors.pink),
                      _buildCategoryChip(context, 'Financeiro', AppColors.pink),
                      _buildCategoryChip(context, 'Outros', AppColors.pink),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  _buildTextField(context, 'Empresa'),
                  _buildTextField(context, 'URL'),
                  _buildTextField(context, 'Login'),
                  _buildTextField(context, 'Senha'),
                  _buildTextField(context, 'PIN'),
                  _buildTextField(context, 'Instruções', maxLines: 3),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBottomSheetButton(context, 'Cancelar', Colors.grey),
                      _buildBottomSheetButton(
                          context, 'Salvar', AppColors.pink),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryChip(BuildContext context, String label, Color color) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
      backgroundColor: color,
    );
  }

  Widget _buildTextField(BuildContext context, String hint,
      {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheetButton(
      BuildContext context, String label, Color color) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        minimumSize: Size(120.w, 45.h),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
