import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final bool isObscure;
  final ValueChanged<String>? onChanged;  

  const TextInputField({
    super.key,
    required this.labelText,
    required this.isObscure,
    this.onChanged,  
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
          obscureText: isObscure,
          onChanged: onChanged,  // Passando o onChanged para o TextField
        ),
      ],
    );
  }
}
