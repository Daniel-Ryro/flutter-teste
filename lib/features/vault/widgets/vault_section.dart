import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VaultSection extends StatelessWidget {
  final String title;
  final String description;
  final String? svgPath;
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
    this.title = "Meu Cofre",
    this.description =
        "O resumo de todas as suas informações ficam guardadas no cofre de forma segura e acesso fácil",
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
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white, // Fundo branco para o card
        borderRadius: BorderRadius.circular(12.r), // Bordas arredondadas
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (svgPath != null) ...[
                SvgPicture.asset(
                  svgPath!,
                  width: 40.w,
                  height: 40.h,
                  color: iconColor ?? const Color(0xFF8E44AD),
                ),
                SizedBox(width: 16.w),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: titleFontSize ?? 18.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor ?? Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: descriptionFontSize ?? 14.sp,
                        color: textColor ?? Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (actionWidget != null) ...[
            SizedBox(height: 16.h),
            Center(child: actionWidget!), // Centraliza o botão de ação
          ],
        ],
      ),
    );
  }
}
