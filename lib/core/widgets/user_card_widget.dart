import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guarda_digital_flutter/styles.dart';

class CompactUserCard extends StatelessWidget {
  final String name;
  final String email;
  final Color avatarColor;
  final double iconSize;
  final double avatarRadius;
  final VoidCallback? onTap;
  final Icon? trailingIcon;

  const CompactUserCard({
    super.key,
    required this.name,
    required this.email,
    required this.avatarColor,
    required this.iconSize,
    required this.avatarRadius,
    this.onTap,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                    radius: avatarRadius,
                    backgroundColor: avatarColor,
                    child: SvgPicture.asset(
                      'assets/icon/person_ic.svg',
                      width: 26.w,
                    )),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailingIcon != null) trailingIcon!,
            ],
          ),
        ),
      ),
    );
  }
}
