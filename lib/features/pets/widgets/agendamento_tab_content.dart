import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guarda_digital_flutter/features/pets/widgets/agendamento_item.dart';

import '../../../core/widgets/action_button_widget.dart';

class AgendamentoTabContent extends StatelessWidget {
  const AgendamentoTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ActionButton(
          text: 'Adicionar',
          onPressed: () {},
          textColor: Colors.white,
          buttonColor: Colors.purple,
          fontSize: 16.0,
          borderRadius: 40.0,
          width: 344.0,
          height: 50.0,
          icon: SvgPicture.asset(
            'assets/icon/add_ic.svg',
            width: 20.w,
            height: 20.h,
          ),
          iconPosition: IconPosition.left,
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView(
            children: const [
              AgendamentoItem(
                date: '24/03/2024',
                title: 'Vacina',
                onTap: null,
              ),
              AgendamentoItem(
                date: '07/05/2024',
                title: 'Consulta',
                onTap: null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}



