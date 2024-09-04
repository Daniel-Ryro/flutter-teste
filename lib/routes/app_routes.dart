import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/main/presentation/main_screen.dart';
import 'package:guarda_digital_flutter/features/viacep/presentation/marital_status.dart';

import '../core/bindings/viacep_binding.dart';
import '../features/daily.routine/presentation/daily_routine_screen.dart';
import '../features/login/presentation/notify_guard_screen.dart';
import '../features/login/presentation/landing_screen.dart';
import '../features/login/presentation/signup_screen.dart';
import '../features/help/presentation/help_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/notification/presentation/notification_screen.dart';
import '../features/user_settings.dart/presentation/user_setting_screen.dart';
import '../features/viacep/presentation/zip_code_screen.dart';
import '../features/vault/presentation/vault_screen.dart';
import '../core/bindings/user_settings_bindings.dart';

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
  static const String helpScreen = '/helpScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String maritalStatusScreen = '/maritalStatusScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return GetPageRoute(
          page: () => const LandingScreen(),
        );
      case loginExecute:
        return GetPageRoute(
          page: () => const LoginExecuteScreen(),
        );
      case maritalStatusScreen:
        return GetPageRoute(
          page: () => MaritalStatusScreen(),
        );
      case signUpScreen:
        return GetPageRoute(
          page: () => SignUpScreen(),
        );
      case homeScreen:
        return GetPageRoute(
          page: () => const HomeScreen(),
        );
      case vaultScreen:
        return GetPageRoute(
          page: () => const VaultScreen(),
        );
      case dailyRoutine:
        return GetPageRoute(
          page: () => const DailyRoutineScreen(),
        );
      case main:
        return GetPageRoute(
          page: () => const MainScreen(),
        );

      // Aplicando o UserSettingsBindings para a rota de configurações do usuário
      case userSettings:
        return GetPageRoute(
          page: () => const UserSettingsScreen(),
          binding: UserSettingsBindings(),
        );

      // Aplicando o ViaCepBinding para a rota ZipCode
      case zipCode:
        return GetPageRoute(
          page: () => ZipCodeScreen(),
          binding: ViaCepBinding(),
        );

      case helpScreen:
        return GetPageRoute(
          page: () => const HelpSettingsScreen(),
        );
      case notificationScreen:
        return GetPageRoute(
          page: () => const NotificationsScreen(),
        );

      default:
        return GetPageRoute(
          page: () => const Scaffold(
            body: Center(
              child: Text('Rota não encontrada'),
            ),
          ),
        );
    }
  }
}
