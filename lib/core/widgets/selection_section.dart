import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';

class SelectionSection extends StatefulWidget {
  final String title;
  final List<String> options;
  final String initialSelection;
  final Color? selectedColor;
  final Color? unselectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final Color? borderColor;

  const SelectionSection({
    super.key,
    required this.title,
    required this.options,
    this.initialSelection = '',
    this.selectedColor,
    this.unselectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.borderColor,
  });

  @override
  _SelectionSectionState createState() => _SelectionSectionState();
}

class _SelectionSectionState extends State<SelectionSection> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.initialSelection.isNotEmpty
        ? widget.initialSelection
        : widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
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
          children: widget.options.map((option) {
            return _buildSelectionButton(option);
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSelectionButton(String text) {
    bool isSelected = _selectedOption == text;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedOption = text;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected
            ? widget.selectedColor ?? AppColors.pink
            : widget.unselectedColor ?? Colors.white,
        side: BorderSide(
          color: widget.borderColor ?? AppColors.greyButton,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          color: isSelected
              ? widget.selectedTextColor ?? Colors.white
              : widget.unselectedTextColor ?? AppColors.blackDefault,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
