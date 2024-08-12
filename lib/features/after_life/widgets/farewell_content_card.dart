import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';
import '../widgets/funeral_type_section.dart';
import '../widgets/service_type_input.dart';
import '../widgets/instructions_input.dart';
import '../widgets/title_section.dart';

class FarewellContentCard extends StatelessWidget {
  const FarewellContentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
