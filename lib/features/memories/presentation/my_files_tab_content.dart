import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/memories/widgets/my_files_header.dart';
import '../widgets/my_file_add_file_option.dart';
import '../widgets/my_files_card.dart';

class MyFilesTabContent extends StatelessWidget {
  const MyFilesTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyFilesHeader(),
        SizedBox(height: 10.h),
        const MyFilesCard(),
        AddFileOption(
          svgIconPath: 'assets/icon/cam_ic.svg',
          label: 'ADICIONAR VÍDEO',
          onTap: () {},
        ),
        SizedBox(height: 8.h),
        AddFileOption(
          svgIconPath: 'assets/icon/file_memories_ic.svg',
          label: 'ADICIONAR IMAGENS',
          onTap: () {},
        ),
        SizedBox(height: 8.h),
        AddFileOption(
          svgIconPath: 'assets/icon/audio_ic.svg',
          label: 'ADICIONAR ÁUDIO',
          onTap: () {},
        ),
      ],
    );
  }
}
