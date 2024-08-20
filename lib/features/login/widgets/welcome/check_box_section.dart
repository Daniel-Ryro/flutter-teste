import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxSection extends StatelessWidget {
  const CheckboxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (bool? value) {},
        ),
        Text(
          'Não quero ver mais visualizar',
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFF7B7B7B),
          ),
        ),
      ],
    );
  }
}
