import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guarda_digital_flutter/features/pets/widgets/scheduling_item.dart';

import '../../../core/widgets/action_button_widget.dart';

class SchedulingTabContent extends StatelessWidget {
  const SchedulingTabContent({super.key});

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
              SchedulingItem(
                date: '24/03/2024',
                title: 'Vacina',
                onTap: null,
              ),
              SchedulingItem(
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



