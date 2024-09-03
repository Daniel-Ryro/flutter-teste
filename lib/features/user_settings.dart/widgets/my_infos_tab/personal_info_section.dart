import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_infos_tab/personal_info_item.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../routes/app_routes.dart'; // Importa a biblioteca de máscara

class PersonalInfoSection extends StatelessWidget {
  final String cpf;
  final String birthDate;
  final String email;
  final String phone;
  final String? address;
  final String? maritalStatus;

  // Adicione o formatter para o CPF
  final maskCpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  PersonalInfoSection({
    super.key,
    required this.cpf,
    required this.birthDate,
    required this.email,
    required this.phone,
    this.address,
    this.maritalStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalInfoItem(
            title: 'CPF',
            value: maskCpfFormatter
                .maskText(cpf), // Aplica a máscara ao valor do CPF
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'Data Nascimento',
            value: birthDate,
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'E-mail',
            value: email,
            trailingIcon: Icons.arrow_forward_ios,
            onTap: () {
              // Adicione a lógica de navegação aqui se necessário
            },
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'Tel/Cel:',
            value: phone,
            trailingIcon: Icons.arrow_forward_ios,
            onTap: () {
              // Adicione a lógica de navegação aqui se necessário
            },
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'Endereço',
            value: address.toString(),
            trailingIcon: Icons.arrow_forward_ios,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.zipCode);
            },
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'Estado civil',
            value: maritalStatus.toString(),
            trailingIcon: Icons.arrow_forward_ios,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.maritalStatusScreen);
            },
          ),
        ],
      ),
    );
  }
}
