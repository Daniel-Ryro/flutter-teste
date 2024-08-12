import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../styles.dart';
import '../../../core/widgets/action_button_widget.dart';

class VideoMessageSection extends StatelessWidget {
  const VideoMessageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Você pode deixar sua mensagem também em vídeo clicando no botão abaixo',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 16.h),
        ActionButton(
          icon: SvgPicture.asset(
            'assets/icon/cam_ic.svg',
            width: 24.w,
            height: 24.h,
          ),
          text: 'CRIAR HOMENAGEM PARA MIM',
          onPressed: () {},
          textColor: Colors.white,
          buttonColor: AppColors.pink,
          fontSize: 14.sp,
          borderRadius: 5.r,
          width: double.infinity,
          height: 40.h,
        ),
      ],
    );
  }
}
