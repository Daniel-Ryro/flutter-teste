import 'package:flutter/material.dart';

enum IconPosition { left, right }

class ActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? borderColor;
  final Color textColor;
  final Color buttonColor;
  final double fontSize;
  final double borderRadius;
  final double? width;
  final double? height;
  final bool isBold;
  final Widget? icon;
  final IconPosition iconPosition;
  final BorderSide? borderSide; // Borda opcional

  const ActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor,
    required this.textColor,
    required this.buttonColor,
    required this.fontSize,
    required this.borderRadius,
    this.width,
    this.height,
    this.isBold = true,
    this.icon,
    this.iconPosition = IconPosition.left,
    this.borderSide, // Inicializando o parâmetro de borda opcional
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: buttonColor,
          side: borderSide ?? (borderColor != null
              ? BorderSide(color: borderColor!, width: 2.0)
              : BorderSide.none), // Define a borda opcional
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && iconPosition == IconPosition.left) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (icon != null && iconPosition == IconPosition.right) ...[
              const Spacer(),
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}
