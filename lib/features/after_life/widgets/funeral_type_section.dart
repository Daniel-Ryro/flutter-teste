import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styles.dart';

class FuneralTypeSection extends StatefulWidget {
  const FuneralTypeSection({super.key});

  @override
  _FuneralTypeSectionState createState() => _FuneralTypeSectionState();
}

class _FuneralTypeSectionState extends State<FuneralTypeSection> {
  String _selectedFuneralType = 'Não definido';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tipo de funeral',
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.blackDefault,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            _buildFuneralTypeButton('Não definido'),
            _buildFuneralTypeButton('Tradicional'),
            _buildFuneralTypeButton('Crematório'),
            _buildFuneralTypeButton('Mausoléu'),
            _buildFuneralTypeButton('Memorial'),
            _buildFuneralTypeButton('Sepulamento verde'),
          ],
        ),
      ],
    );
  }

  Widget _buildFuneralTypeButton(String text) {
    bool isSelected = _selectedFuneralType == text;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedFuneralType = text;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? AppColors.pink : Colors.white,
        side: const BorderSide(color: AppColors.greyButton),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: isSelected ? Colors.white : AppColors.blackDefault,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
