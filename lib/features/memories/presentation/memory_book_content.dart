import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/memory_book_header.dart';
import '../widgets/add_person_row.dart';
import '../widgets/category_selection.dart';
import '../widgets/memory_card.dart';

class MemoryBookTabContent extends StatelessWidget {
  const MemoryBookTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MemoryBookHeader(),
        SizedBox(height: 16.h),
        const AddPersonRow(),
        SizedBox(height: 16.h),
        const Divider(),
        SizedBox(height: 16.h),
        const CategorySelection(),
        SizedBox(height: 16.h),
        const MemoryCard(),
      ],
    );
  }
}
