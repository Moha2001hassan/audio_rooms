import 'package:flutter/material.dart';
import '../../features/auth/view/screens/forget_password.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/signup.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
