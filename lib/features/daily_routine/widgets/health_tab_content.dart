import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guarda_digital_flutter/features/daily_routine/widgets/healt_header_section.dart';
import 'package:guarda_digital_flutter/features/daily_routine/widgets/medical_tab_content.dart';
import 'package:guarda_digital_flutter/features/daily_routine/widgets/period_selector.dart';
import 'package:guarda_digital_flutter/features/daily_routine/widgets/question_list.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../styles.dart';


class HealthTabContent extends StatefulWidget {
  const HealthTabContent({super.key});

  @override
  _HealthTabContentState createState() => _HealthTabContentState();
}

class _HealthTabContentState extends State<HealthTabContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        const HealthHeaderSection(),
        SizedBox(height: 16.h),
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primary,
          tabs: const [
            Tab(text: 'Saúde'),
            Tab(text: 'Histórico Médico'),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildHealthContent(),
              const MedicalHistoryContent(),
            ],
          ),
        ),
      ],
    );
  }

Widget _buildHealthContent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16.h),
      const PeriodSelection(),
      SizedBox(height: 16.h),
      Text(
        'Reserve um tempo para você poder responder todas as perguntas com calma e responsabilidade',
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.blackDefault,
        ),
      ),
      SizedBox(height: 16.h),
      const QuestionList(),
      SizedBox(height: 16.h),
      Center(
        child: ActionButton(
          text: 'INCLUIR REPRESENTANTE',
          onPressed: () {},
          textColor: Colors.white,
          buttonColor: AppColors.pink,
          fontSize: 14.sp,
          borderRadius: 10.r,
          width: 300.w,
          height: 45.h,
          icon: SvgPicture.asset(
            'assets/icon/add_ic.svg',
            width: 21.w,
            height: 24.h,
          ),
        ),
      ),
    ],
  );
}

}
