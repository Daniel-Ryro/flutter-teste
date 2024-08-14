import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';

import '../../../../core/widgets/action_button_widget.dart';

class FamilyInviteCard extends StatelessWidget {
  final int remainingInvites;
  final VoidCallback onInvitePressed;

  const FamilyInviteCard({
    super.key,
    required this.remainingInvites,
    required this.onInvitePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Familiares',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Escolha até 5 familiares para\ncompartilhar seu conteúdo',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 12.h),
          Center(
            child: ActionButton(
              text: 'Enviar Convites +3',
              onPressed: () {},
              textColor: Colors.white,
              buttonColor: Colors.purple,
              fontSize: 16.0,
              borderRadius: 40.0,
              width: 300.0,
              height: 50.0,
            ),
          ),
        ],
      ),
    );
  }
}
