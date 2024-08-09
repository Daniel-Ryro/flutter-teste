import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final IconData statusIcon;
  final IconData arrowIcon;
  final Color statusIconColor;
  final Color iconColor;
  final VoidCallback onTap;
  final double iconSize;
  final double fontSize;
  final Color fontColor;
  final bool bold;
  final double arrowSize;

  const StatusCard({
    super.key,
    required this.title,
    required this.statusIcon,
    required this.arrowIcon,
    required this.statusIconColor,
    required this.iconColor,
    required this.onTap,
    required this.iconSize,
    required this.fontSize,
    required this.fontColor,
    required this.arrowSize,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  statusIcon,
                  color: statusIconColor,
                  size: iconSize,
                ),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                    color: fontColor,
                  ),
                ),
              ],
            ),
            Icon(
              arrowIcon,
              color: iconColor,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
