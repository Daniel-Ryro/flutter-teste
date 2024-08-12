import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/form_widget.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../core/widgets/user_card_widget.dart';
import '../widgets/vault_section.dart';

class BeneficiaryContent extends StatelessWidget {
  const BeneficiaryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RectangleButton(
          text: 'BENEFICIÁRIOS',
          color: AppColors.pink,
          onPressed: () {},
        ),
        SizedBox(height: 18.h),
        VaultSection(
          title: 'Beneficiários',
          description:
              'Os beneficiários são aqueles que você escolhe para herdar seus bens',
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
        CompactUserCard(
          name: 'John Doe',
          email: 'johndoe@example.com',
          avatarColor: AppColors.pink,
          iconSize: 50.0,
          avatarRadius: 30.0,
          trailingIcon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
          ),
          onTap: () {},
        ),
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
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: ExecutorForm(
              title: 'Adicionar Benificiários',
              firstNameLabel: 'Primeiro Nome',
              secondNameLabel: 'Segundo nome',
              lastNameLabel: 'Último Nome',
              emailLabel: 'Email',
              birthDateLabel: 'Data de Nascimento',
              phoneLabel: 'Celular',
              insertPhotoLabel: 'Inserir Foto',
              insertPhotoColor: AppColors.pink,
              onInsertPhoto: () {},
              cancelButtonText: 'Cancelar',
              saveButtonText: 'Salvar',
              cancelButtonColor: AppColors.purpleButton,
              cancelButtonTextColor: AppColors.purpleButton,
              onCancel: () {
                Navigator.of(context).pop();
              },
              onSave: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
