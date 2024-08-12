import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/rectangle_button.dart';
import '../../../styles.dart';
import '../widgets/title_section.dart';

class MyWishContent extends StatelessWidget {
  const MyWishContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onbackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RectangleButton(
                text: 'MEUS DESEJOS',
                color: AppColors.pink,
                onPressed: () {},
              ),
              SizedBox(height: 16.h),
              _buildContentCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSection(
              title: 'Meus Desejos',
              subtitle:
                  'Deixe seus desejos e orientações sobre suas vontades para os executores e beneficiários',
            ),
            SizedBox(height: 16.h),
            _buildInstructionsSection(),
            SizedBox(height: 16.h),
            _buildTextFieldsSection(),
            SizedBox(height: 16.h),
            _buildVideoMessageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInstructionItem(
          number: '1',
          text: 'Escreva no campo as suas orientações e desejos.',
        ),
        SizedBox(height: 8.h),
        _buildInstructionItem(
          number: '2',
          text:
              'Você pode manter, editar ou criar uma nova sugestão dos desejos.',
        ),
      ],
    );
  }

  Widget _buildInstructionItem({required String number, required String text}) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.w,
            backgroundColor: AppColors.pink,
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.blackDefault,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabeledTextField(
          label: 'Executores',
          hint:
              'Escreva no campo abaixo instruções e desejos para os Executores',
        ),
        SizedBox(height: 16.h),
        _buildLabeledTextField(
          label: 'Beneficiários',
          hint:
              'Escreva no campo abaixo instruções e desejos para os Beneficiários',
        ),
      ],
    );
  }

  Widget _buildLabeledTextField({required String label, required String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackDefault,
          ),
        ),
        SizedBox(height: 4.h), // Ajuste do espaçamento entre o label e o hint
        Text(
          hint,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600], // Cor do texto do hint
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Descrição',
            hintStyle:
                TextStyle(color: Colors.grey[500]), // Ajuste da cor do hint
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideoMessageSection() {
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
