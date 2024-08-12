import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guarda_digital_flutter/features/pets/widgets/add_form.dart';
import '../../../core/widgets/action_button_widget.dart';

class PetsTabContent extends StatelessWidget {
  const PetsTabContent({Key? key}) : super(key: key);

  void _showAddPetForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.w,
          right: 16.w,
        ),
        child: const FractionallySizedBox(
          heightFactor: 0.9,
          child: AddPetForm(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        ActionButton(
          text: 'Adicionar',
          onPressed: () => _showAddPetForm(context),
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
              // Aqui você pode adicionar os itens da lista de pets como mostrado anteriormente
            ],
          ),
        ),
      ],
    );
  }
}
