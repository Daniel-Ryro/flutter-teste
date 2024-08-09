import 'package:flutter/material.dart';

import '../features/login/presentation/screens/login_execute_screen.dart';
import '../features/login/presentation/screens/login_screen.dart';
import '../features/login/presentation/screens/signin_screen.dart';
import '../features/login/presentation/screens/signup_screen.dart';

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
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
        case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
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
