import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/l10n.dart';

class AccessDescription extends StatelessWidget {
  const AccessDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: S.of(context).accessContentPart1,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: S.of(context).accessContentPart2,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: S.of(context).accessContentPart3,
          ),
          TextSpan(
            text: S.of(context).accessContentPart4,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: S.of(context).accessContentPart5,
          ),
          TextSpan(
            text: S.of(context).accessContentPart6,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
