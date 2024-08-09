import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color boxDecorationColor;
  final Color textColor;
  final double fontSize;
  final Color iconColor;
  final double iconSize;

  const ListItem({
    super.key,
    required this.text,
    required this.onTap, 
    required this.boxDecorationColor,
    required this.fontSize,
    required this.iconColor,
    required this.iconSize,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: boxDecorationColor,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }
}
