import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';
import '../widgets/tribute_content_card.dart';

class TributeContent extends StatelessWidget {
  const TributeContent({super.key});

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
                text: 'HOMENAGEM',
                color: AppColors.pink,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              const TributeContentCard(),
            ],
          ),
        ),
      ),
    );
  }
}
