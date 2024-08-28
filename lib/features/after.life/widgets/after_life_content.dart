import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/features/after.life/presentation/assets_estate_page.dart';
import 'package:guarda_digital_flutter/features/after.life/presentation/farewell_page.dart';
import 'package:guarda_digital_flutter/features/after.life/presentation/my_wish_page.dart';
import 'package:guarda_digital_flutter/features/after.life/presentation/tribute_page.dart';

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
        return const AssetsEstatePage();
      case 1:
        return const TributePage();
      case 2:
        return const FarewellPage();
      case 3:
        return const MyWishPage();
      default:
        return const AssetsEstatePage();
    }
  }
}
