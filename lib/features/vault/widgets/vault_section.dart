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
      height: height ?? 300.h,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
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
                        fontSize: titleFontSize ?? 20.sp,
                        fontWeight: FontWeight.bold,
                        color: textColor ?? Colors.black,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: descriptionFontSize ?? 16.sp,
                        color: textColor ?? Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (actionWidget != null) ...[
            SizedBox(height: 8.h),
            actionWidget!,
          ],
          const Spacer(), // Empurra a imagem para o final do container
          Container(
            margin: EdgeInsets.only(top: 8.h),
            child: Image.asset(
              'assets/img/parents-with-their-children-walking-forest 1.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100.h, // Ajuste a altura conforme necessário
            ),
          ),
        ],
      ),
    );
  }
}
