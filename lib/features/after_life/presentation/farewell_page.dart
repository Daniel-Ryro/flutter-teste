import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';
import '../widgets/farewell_content_card.dart';

class FarewellPage  extends StatelessWidget {
  const FarewellPage ({super.key});

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
              const FarewellContentCard(),
            ],
          ),
        ),
      ),
    );
  }
}
