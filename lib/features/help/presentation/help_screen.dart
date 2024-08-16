import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../../main/presentation/main_screen.dart';
import '../widget/help_option_card.dart';

class HelpSettingsScreen extends StatefulWidget {
  const HelpSettingsScreen({super.key});

  @override
  _HelpSettingsScreenState createState() => _HelpSettingsScreenState();
}

class _HelpSettingsScreenState extends State<HelpSettingsScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Central de Ajuda',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Como agente pode te ajudar hoje ?',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    HelpOptionCard(
                      icon: Icons.help_outline,
                      title: 'Dúvidas Frequentes',
                      description:
                          'Veja perguntas frequentes sobre nossos serviços',
                      onTap: () {},
                    ),
                    SizedBox(height: 20.h),
                    HelpOptionCard(
                      icon: Icons.more_sharp,
                      title: 'Fala com nossos Atendentes',
                      description:
                          'Compartilhe suas memorias e lembranças organizadas de uma maneira fácil',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
