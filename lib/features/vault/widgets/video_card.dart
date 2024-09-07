import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/styles.dart';
import '../../../core/widgets/rectangle_button.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.pink),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.video_call, color: AppColors.pink, size: 24.sp),
              SizedBox(width: 4.w),
              Text(
                'Video Executor',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackDefault,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Clique no botão para gravar o seu vídeo',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.blackDefault,
            ),
          ),
          SizedBox(height: 12.h),
          RectangleButton(
            text: 'Gravar',
            color: AppColors.pink,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
