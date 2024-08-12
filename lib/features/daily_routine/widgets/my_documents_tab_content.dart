import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../styles.dart';
import 'my_documents_header.dart';
import 'insert_document_card.dart';
import 'document_item.dart';

class MyDocumentsTabContent extends StatelessWidget {
  const MyDocumentsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyDocumentsHeader(),
          SizedBox(height: 16.h),
          const InsertDocumentCard(),
          SizedBox(height: 16.h),
          Text(
            'Documentos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: AppColors.blackDefault,
            ),
          ),
          const Divider(color: AppColors.pink),
          SizedBox(height: 8.h),
          const DocumentItem(title: 'RG'),
          const DocumentItem(title: 'CPF'),
          const DocumentItem(title: 'Passaporte'),
        ],
      ),
    );
  }
}
