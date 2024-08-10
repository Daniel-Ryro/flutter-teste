import 'package:flutter/material.dart';

import '../features/account/presentation/screens/notify_guard_screen.dart';
import '../features/account/presentation/screens/landing_screen.dart';
import '../features/account/presentation/screens/signin_screen.dart';
import '../features/account/presentation/screens/signup_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String loginExecute = '/loginExecute';
  static const String signUpScreen = '/SignUpScreen';
  static const String signInScreen = '/SignInScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case loginExecute:
        return MaterialPageRoute(builder: (_) => const LoginExecuteScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
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
