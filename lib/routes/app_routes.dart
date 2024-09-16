import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guarda_digital_flutter/features/main/presentation/main_screen.dart';
import 'package:guarda_digital_flutter/features/viacep/presentation/marital_status.dart';
import '../core/bindings/account_binding.dart';
import '../core/bindings/landing_binding.dart';
import '../core/bindings/viacep_binding.dart';
import '../core/bindings/user_settings_bindings.dart';
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

class AppRoutes {
  // Definindo as constantes de rota
  static const String login = '/login';
  static const String loginExecute = '/loginExecute';
  static const String main = '/main';
  static const String signUpScreen = '/SignUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String vaultScreen = '/vaultScreen';
  static const String dailyRoutine = '/dailyRoutineScreen';
  static const String userSettings = '/userSettingsScreen';
  static const String zipCode = '/zipCodeScreen';
  static const String helpScreen = '/helpScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String maritalStatusScreen = '/maritalStatusScreen';

  // Lista de rotas usando GetPage
  static final List<GetPage> pages = [
    GetPage(
      name: login,
      page: () => const LandingScreen(),
      binding: LandingBinding(),
    ),
    GetPage(name: loginExecute, page: () => const LoginExecuteScreen()),
    GetPage(name: main, page: () => const MainScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(
      name: vaultScreen,
      page: () => const VaultScreen(),
      binding: AccountBinding(),
    ),
    GetPage(name: dailyRoutine, page: () => const DailyRoutineScreen()),
    GetPage(name: maritalStatusScreen, page: () => MaritalStatusScreen()),
    GetPage(name: helpScreen, page: () => const HelpSettingsScreen()),
    GetPage(name: notificationScreen, page: () => const NotificationsScreen()),
    GetPage(
      name: userSettings,
      page: () => const UserSettingsScreen(),
      binding: UserSettingsBindings(),
    ),
    GetPage(
      name: zipCode,
      page: () => ZipCodeScreen(),
      binding: ViaCepBinding(),
    ),
  ];
}
