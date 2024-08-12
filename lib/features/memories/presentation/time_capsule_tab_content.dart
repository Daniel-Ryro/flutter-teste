import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guarda_digital_flutter/features/after_life/widgets/title_section.dart';
import '../../../styles.dart';
import '../widgets/time_capsule_card.dart';
import '../widgets/time_capsule_header.dart';

class TimeCapsuleTabContent extends StatefulWidget {
  const TimeCapsuleTabContent({super.key});

  @override
  _TimeCapsuleTabContentState createState() => _TimeCapsuleTabContentState();
}

class _TimeCapsuleTabContentState extends State<TimeCapsuleTabContent>
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
        const TimeCapsuleHeader(),
        SizedBox(height: 10.h),
        const TimeCapsuleCard(),
        SizedBox(height: 16.h),
        TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: Colors.grey,
          indicatorColor: AppColors.primary,
          tabs: const [
            Tab(text: 'Minhas Cápsulas'),
            Tab(text: 'Cápsulas Recebidas'),
          ],
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 300.h, 
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildMyCapsulesTab(),
              _buildReceivedCapsulesTab(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMyCapsulesTab() {
    return _buildCapsuleCard(); // Conteúdo para a aba "Minhas Cápsulas"
  }

  Widget _buildReceivedCapsulesTab() {
    return Center(
      child: Text(
        'Nenhuma cápsula recebida ainda.',
        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
      ),
    ); // Conteúdo para a aba "Cápsulas Recebidas"
  }

  Widget _buildCapsuleCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
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
              Image.asset(
                'assets/img/parents-with-their-children-walking-forest 1.png',
                width: double.infinity,
                height: 180.h,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.h),
              Text(
                'Reunião família',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackDefault,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Data Abertura Cápsula: 13/04/2024',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
