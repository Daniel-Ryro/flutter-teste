import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import 'video_card.dart';

class VideosSection extends StatelessWidget {
  const VideosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vídeos',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          'Aqui você tem todos os arquivos do seu testamento separados e organizados',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: VideoCard()),
            SizedBox(width: 8.w),
            Expanded(child: VideoCard()),
          ],
        ),
      ],
    );
  }
}
