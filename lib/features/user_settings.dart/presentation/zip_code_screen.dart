import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../routes/app_routes.dart';
import '../../../styles.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../main/presentation/main_screen.dart';

class ZipCodeScreen extends StatelessWidget {
  const ZipCodeScreen({super.key});

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
            // Action for user settings icon
            Navigator.pushNamed(context, AppRoutes.userSettings);
            // Navigate to the user settings page
          },
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Digite o CEP/Zip Code de onde você mora',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Não sei o cep',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite seu CEP/Zip Code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20.h),
                  ActionButton(
                    text: 'CONTINUE',
                    onPressed: () {},
                    textColor: Colors.white,
                    buttonColor: AppColors.pink,
                    fontSize: 14.sp,
                    borderRadius: 5.r,
                    width: double.infinity,
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 0, // ou a aba correspondente
        onTabSelected: (index) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreen(),
                settings: RouteSettings(arguments: index)),
            (Route<dynamic> route) => false,
          );
        },
      ),
    );
  }
}
