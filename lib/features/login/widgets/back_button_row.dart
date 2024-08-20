import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';

class BackButtonRow extends StatelessWidget {
  const BackButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            S.of(context).cancel,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
