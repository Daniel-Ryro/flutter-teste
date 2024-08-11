import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VaultSection extends StatelessWidget {
  final String title;
  final String description;
  final String? svgPath; // Changed to nullable type
  final Widget? actionWidget;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? titleFontSize;
  final double? descriptionFontSize;

  const VaultSection({
    super.key,
    required this.title,
    required this.description,
    this.svgPath,
    this.actionWidget,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.width,
    this.height,
    this.titleFontSize,
    this.descriptionFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (svgPath != null) ...[
                SvgPicture.asset(
                  svgPath!,
                  width: 24.w,
                  height: 24.h,
                  color: iconColor ?? Colors.purple,
                ),
                SizedBox(width: 8.w),
              ],
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize ?? 16.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor ?? Colors.black,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: TextStyle(
              fontSize: descriptionFontSize ?? 14.sp,
              color: textColor ?? Colors.grey[600],
            ),
          ),
          if (actionWidget != null) ...[
            SizedBox(height: 8.h),
            actionWidget!,
          ],
        ],
      ),
    );
  }
}
