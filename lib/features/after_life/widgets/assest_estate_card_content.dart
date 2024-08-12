import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';
import 'title_section.dart';
import 'value_estimated_container.dart';
import 'representative_info_text.dart';
import 'add_estate_button.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key}) : super(key: key);

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
