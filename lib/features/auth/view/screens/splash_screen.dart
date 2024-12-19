import 'package:audio_rooms/core/helpers/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../data/remote/auth_firebase.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    FirebaseAuthService authService = FirebaseAuthService();
    bool isLoggedIn = await authService.getLoginStatus();

    // Simulate a delay to show the splash screen
    await Future.delayed(const Duration(seconds: 3));

    if (isLoggedIn) {
      context.pushNamedAndRemoveUntil(Routes.roomsPage,
          predicate: (route) => false);
    } else {
      context.pushNamedAndRemoveUntil(Routes.onboardingScreen,
          predicate: (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/dollars_logo.png',
              width: 85,
              height: 85,
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: LinearProgressIndicator(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
