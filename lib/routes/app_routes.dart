import 'package:flutter/material.dart';
import 'package:guarda_digital_flutter/features/main/presentation/main_screen.dart';

import '../features/account/presentation/notify_guard_screen.dart';
import '../features/account/presentation/landing_screen.dart';
import '../features/account/presentation/signup_screen.dart';
import '../features/daily_routine/presentation/daily_routine_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/user_settings.dart/presentation/user_setting_screen.dart';
import '../features/user_settings.dart/presentation/zip_code_screen.dart';
import '../features/vault/presentation/vault_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String loginExecute = '/loginExecute';
  static const String main = '/main';
  static const String signUpScreen = '/SignUpScreen';
  static const String signInScreen = '/SignInScreen';
  static const String homeScreen = '/homeScreen';
  static const String vaultScreen = '/vaultScreen';
  static const String dailyRoutine = '/dailyRoutineScreen';
  static const String userSettings = '/userSettingsScreen';
  static const String zipCode = '/zipCodeScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case loginExecute:
        return MaterialPageRoute(builder: (_) => const LoginExecuteScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case vaultScreen:
        return MaterialPageRoute(builder: (_) => const VaultScreen());

      case dailyRoutine:
        return MaterialPageRoute(builder: (_) => const DailyRoutineScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case userSettings:
        return MaterialPageRoute(builder: (_) => const UserSettingsScreen());
      case zipCode:
        return MaterialPageRoute(builder: (_) => const ZipCodeScreen());  

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Rota não encontrada'),
            ),
          ),
        );
    }
  }
}
