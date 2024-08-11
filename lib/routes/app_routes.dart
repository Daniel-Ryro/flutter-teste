import 'package:flutter/material.dart';

import '../features/account/presentation/notify_guard_screen.dart';
import '../features/account/presentation/landing_screen.dart';
import '../features/account/presentation/signin_screen.dart';
import '../features/account/presentation/signup_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/vault/presentation/executors_content.dart';
import '../features/vault/presentation/vault_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String loginExecute = '/loginExecute';
  static const String signUpScreen = '/SignUpScreen';
  static const String signInScreen = '/SignInScreen';
  static const String homeScreen = '/homeScreen';
  static const String vaultScreen = '/vaultScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case loginExecute:
        return MaterialPageRoute(builder: (_) => const LoginExecuteScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case vaultScreen:
        return MaterialPageRoute(builder: (_) => const VaultScreen());
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
