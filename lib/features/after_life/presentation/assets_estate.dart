import 'package:flutter/material.dart';

import '../../../core/widgets/rectangle_button.dart';

class AssetsEstateContent extends StatelessWidget {
  const AssetsEstateContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RectangleButton(
              text: 'Primary Button',
              color: Colors.blue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
