import 'package:flutter/material.dart';

class IconRoundedButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double iconSize;
  final Color iconColor;

  const IconRoundedButton ({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.iconSize,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
