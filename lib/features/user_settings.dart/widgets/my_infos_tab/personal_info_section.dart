import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/user_settings.dart/widgets/my_infos_tab/personal_info_item.dart';

import '../../../../routes/app_routes.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({super.key});

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
          const PersonalInfoItem(
            title: 'CPF',
            value: '278.805.056-20',
          ),
          const Divider(),
          const PersonalInfoItem(
            title: 'Data Nascimento',
            value: '10/01/2021',
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'E-mail',
            value: 'jorgealmeida@gmail.com',
            trailingIcon: Icons.arrow_forward_ios,
            onTap: () {
              // Adicione a lógica de navegação aqui se necessário
            },
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'Tel/Cel:',
            value: '(11) 90505-5045',
            trailingIcon: Icons.arrow_forward_ios,
            onTap: () {
              // Adicione a lógica de navegação aqui se necessário
            },
          ),
          const Divider(),
          PersonalInfoItem(
            title: 'Endereço',
            value: 'Rua Anchieta, 562',
            trailingIcon: Icons.arrow_forward_ios,
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.zipCode);
            },
          ),
          const Divider(),
          const PersonalInfoItem(
            title: 'Estado civil',
            value: 'Casado',
          ),
        ],
      ),
    );
  }
}
