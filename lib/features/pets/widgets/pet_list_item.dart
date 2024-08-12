import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PetListItem extends StatelessWidget {
  final String petName;
  final String tutorName;
  final String petImage;

  const PetListItem({
    Key? key,
    required this.petName,
    required this.tutorName,
    required this.petImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.w,
          backgroundImage: AssetImage(petImage),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Nome Pet: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: petName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Tutor: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: tutorName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        trailing: Icon(Icons.chevron_right, size: 24.w),
        onTap: () {
          // Ação ao clicar no item
        },
      ),
    );
  }
}
