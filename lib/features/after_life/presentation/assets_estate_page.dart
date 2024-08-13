import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/after_life/widgets/asset_estate_card.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';

class AssetsEstatePage  extends StatelessWidget {
  const AssetsEstatePage ({super.key});

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
              const ContentCard(),
            ],
          ),
        ),
      ),
    );
  }
}
