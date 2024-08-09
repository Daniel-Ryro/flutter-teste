import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/core/widgets/action_button_widget.dart';

class CofreCard extends StatelessWidget {
  final String? title;
  final Widget? description; // Changed from String? to Widget?
  final IconData? icon;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? iconSize;
  final double? titleFontSize;
  final bool? bold;
  final String? textFieldLabelText;
  final Function(String)? onTextFieldChanged;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? buttonFontSize;
  final double? buttonBorderRadius;
  final double? buttonWidth;
  final Widget? buttonIcon;

  const CofreCard({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.backgroundColor,
    this.width,
    this.height,
    this.iconSize,
    this.titleFontSize,
    this.bold,
    this.textFieldLabelText,
    this.onTextFieldChanged,
    this.buttonText,
    this.onButtonPressed,
    this.buttonColor,
    this.buttonTextColor,
    this.buttonFontSize,
    this.buttonBorderRadius,
    this.buttonWidth,
    this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: backgroundColor ?? Colors.grey,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 100.0,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white,
                size: iconSize ?? 24.0,
              ),
              const SizedBox(height: 16.0),
            ],
            if (title != null) ...[
              Text(
                title!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize ?? 16.0,
                  fontWeight:
                      bold == true ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 8.0),
            ],
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText:
                    textFieldLabelText != null && textFieldLabelText!.isNotEmpty
                        ? textFieldLabelText
                        : null,
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: onTextFieldChanged,
            ),
             if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 16.0),
              ActionButton(
                text: buttonText!,
                onPressed: onButtonPressed!,
                buttonColor: buttonColor ?? Colors.blue,
                textColor: buttonTextColor ?? Colors.white,
                fontSize: buttonFontSize ?? 16.0,
                borderRadius: buttonBorderRadius ?? 8.0,
                width: buttonWidth,
                icon: buttonIcon,
              ),
            ],
            if (description != null) ...[
              const SizedBox(height: 16.0),
              description!,
            ],
          ],
        ),
      ),
    );
  }
}
