import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../../../core/widgets/action_button_widget.dart';

class SubscriptionDetailsCard extends StatelessWidget {
  final String cardNumber;
  final DateTime billingDate;
  final VoidCallback onChangeCard;
  final VoidCallback onRenew;
  final VoidCallback onCancel;

  const SubscriptionDetailsCard({
    super.key,
    required this.cardNumber,
    required this.billingDate,
    required this.onChangeCard,
    required this.onRenew,
    required this.onCancel,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '**** **** **** $cardNumber',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: onChangeCard,
                child: Text(
                  'Trocar',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '${billingDate.day.toString().padLeft(2, '0')} de ${getMonthName(billingDate.month)} de ${billingDate.year}',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 12.h),
          const Divider(color: Colors.black26),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ActionButton(
                text: 'Renovar',
                onPressed: onRenew,
                textColor: Colors.white,
                buttonColor: AppColors.pink,
                fontSize: 16.sp,
                borderRadius: 10.r,
                width: 300.w,
                height: 40.h,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ActionButton(
                text: 'Cancelar assinatura',
                onPressed: onCancel,
                textColor: Colors.black54,
                buttonColor: Colors.grey.shade300,
                fontSize: 16.sp,
                borderRadius: 10.r,
                width: 300.w,
                height: 40.h,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'janeiro';
      case 2:
        return 'fevereiro';
      case 3:
        return 'março';
      case 4:
        return 'abril';
      case 5:
        return 'maio';
      case 6:
        return 'junho';
      case 7:
        return 'julho';
      case 8:
        return 'agosto';
      case 9:
        return 'setembro';
      case 10:
        return 'outubro';
      case 11:
        return 'novembro';
      case 12:
        return 'dezembro';
      default:
        return '';
    }
  }
}
