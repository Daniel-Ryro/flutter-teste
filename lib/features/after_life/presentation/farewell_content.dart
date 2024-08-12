import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';
import '../widgets/funeral_type_section.dart';
import '../widgets/service_type_input.dart';
import '../widgets/instructions_input.dart';
import '../widgets/title_section.dart';

class FarewellContent extends StatelessWidget {
  const FarewellContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RectangleButton(
                text: 'DESPEDIDA',
                color: AppColors.pink,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              _buildContentCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSection(
              title: 'Despedida',
              subtitle: 'Escolha o tipo de despedida que você quer',
            ),
            SizedBox(height: 16.h),
            const FuneralTypeSection(),
            SizedBox(height: 16.h),
            const ServiceTypeInput(),
            SizedBox(height: 16.h),
            const InstructionsInput(),
          ],
        ),
      ),
    );
  }
}
