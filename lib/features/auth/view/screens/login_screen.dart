import 'package:audio_rooms/core/helpers/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              // Logo, Title & Subtitle
              const LoginHeader(),

              // Form
              const LoginForm(),

              MaterialButton(
                onPressed: () {
                  context.pushNamedAndRemoveUntil(
                    Routes.roomsPage,
                    predicate: (route) => false,
                  );
                },
                color: Colors.red,
                child: const Text(
                  'Enter as Guest',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
