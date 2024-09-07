import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/vault/widgets/add_benefiary_form_modal.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../core/widgets/user_card_widget.dart';
import '../../account/controller/account_controller.dart';
import '../../account/data/models/beneficiary_model.dart';
import 'vault_section.dart';

class BeneficiaryContent extends StatelessWidget {
  const BeneficiaryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém o controlador
    final AccountController controller = Get.find<AccountController>();

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
                _showBeneficiaryForm(context);
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
        // Observa mudanças na lista de beneficiários
        Obx(() {
          return Column(
            children: controller.beneficiaries.map((beneficiary) {
              return CompactUserCard(
                name: "${beneficiary.firstName} ${beneficiary.lastName}",
                email: beneficiary.email,
                avatarColor: AppColors.pink,
                iconSize: 50.0,
                avatarRadius: 30.0,
                trailingIcon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  // Ação ao tocar no card do beneficiário
                },
              );
            }).toList(),
          );
        }),
      ],
    );
  }

  // Método para abrir o formulário de adicionar beneficiário
  void _showBeneficiaryForm(BuildContext context) {
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
        return BeneficiaryFormModal(
          beneficiary: BeneficiaryModel(
            personId: 0,
            accountId: 0,
            firstName: '',
            middleName: '',
            lastName: '',
            cellPhone: '',
            email: '',
            birthDate: DateTime.now(),
          ),
          onSave: (newBeneficiary) {
            Get.find<AccountController>()
                .addOrUpdateBeneficiary(newBeneficiary);
          },
        );
      },
    );
  }
}
