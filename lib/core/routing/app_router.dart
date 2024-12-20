import 'package:audio_rooms/features/auth/view/screens/splash_screen.dart';
import 'package:audio_rooms/features/rooms/screens/rooms_page.dart';
import 'package:flutter/material.dart';
import '../../features/auth/view/screens/forget_password.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/signup.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signupScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case Routes.roomsPage:
        return MaterialPageRoute(builder: (_) => const RoomsPage());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
