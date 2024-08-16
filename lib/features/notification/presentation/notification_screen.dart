import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../../main/presentation/main_screen.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        "title": "Tenha acesso as suas diárias",
        "description":
            "Tenha acesso as suas informações diárias de forma dinâmica histórico medico e documentos",
        "timeAgo": "agora"
      },
      {
        "title": "Tenha acesso as suas diárias",
        "description":
            "Tenha acesso as suas informações diárias de forma dinâmica histórico medico e documentos",
        "timeAgo": "1 mês"
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.onbackground,
      appBar: CustomAppBar(
        iconPaths: const [
          'assets/icon/notification_ic.svg',
          'assets/icon/help_ic.svg',
          'assets/icon/user_setting_ic.svg',
        ],
        iconActions: [
          () {
            Navigator.pushNamed(context, AppRoutes.notificationScreen);
          },
          () {
            Navigator.pushNamed(context, AppRoutes.helpScreen);
          },
          () {
            Navigator.pushNamed(context, AppRoutes.userSettings);
          },
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Notificações",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    title: notifications[index]['title']!,
                    description: notifications[index]['description']!,
                    timeAgo: notifications[index]['timeAgo']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0,
        onTabSelected: (index) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const MainScreen(),
                settings: RouteSettings(arguments: index)),
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }
}
