import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/assets_estate_content.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/farewell_content.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/my_wish_content.dart';
import 'package:guarda_digital_flutter/features/after_life/presentation/tribute_content.dart';

class AfterLifeContent extends StatelessWidget {
  final int selectedIndex;

  const AfterLifeContent({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return const AssetsEstateContent();
      case 1:
        return const TributeContent();
      case 2:
        return const FarewellContent();
      case 3:
        return const MyWishContent();
      default:
        return const AssetsEstateContent();
    }
  }
}
