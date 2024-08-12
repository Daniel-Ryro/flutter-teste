import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';
import '../widgets/add_estate_button.dart';
import '../widgets/representative_info_text.dart';
import '../widgets/value_estimated_container.dart';
import '../widgets/title_section.dart';

class AssetsEstateContent extends StatelessWidget {
  const AssetsEstateContent({super.key});

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
                text: 'BENS E PATRIMÔNIO',
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
              title: 'Bens e Patrimônio',
              subtitle: 'Evite conflitos e disputas por um patrimônio específico no futuro.',
            ),
            SizedBox(height: 16.h),
            const ValueEstimatedContainer(),
            SizedBox(height: 16.h),
            const RepresentativeInfoText(),
            SizedBox(height: 16.h),
            const AddEstateButton(),
          ],
        ),
      ),
    );
  }
}
