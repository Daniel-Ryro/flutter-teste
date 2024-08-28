import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/after.life/widgets/my_wish_text_fields_section.dart';
import 'package:guarda_digital_flutter/features/after.life/widgets/my_wish_video_message_section.dart';
import '../../../styles.dart';
import 'title_section.dart';
import 'instructions_section.dart';


class MyWishContentCard extends StatelessWidget {
  const MyWishContentCard({Key? key}) : super(key: key);

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
              title: 'Meus Desejos',
              subtitle:
                  'Deixe seus desejos e orientações sobre suas vontades para os executores e beneficiários',
            ),
            SizedBox(height: 16.h),
            const GeneralInstructionsSection (),
            SizedBox(height: 16.h),
            const MyWishTextFieldsSection(),
            SizedBox(height: 16.h),
            const VideoMessageSection(),
          ],
        ),
      ),
    );
  }
}
