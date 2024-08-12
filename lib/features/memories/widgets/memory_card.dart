import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class MemoryCard extends StatelessWidget {
  const MemoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: AppColors.onbackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMemoryItem(),
          SizedBox(height: 30.h),
          _buildMemoryItem(),
          SizedBox(height: 30.h),
          _buildMemoryItem(),
          SizedBox(height: 30.h),
          _buildMemoryItem(),
        ],
      ),
    );
  }

  Widget _buildMemoryItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              'assets/img/parents-with-their-children-walking-forest 1.png',
              width: double.infinity,
              height: 180.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.0)),
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hotel Pasadena',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '02/05/2024',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
