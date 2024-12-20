import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        Image(
          image: AssetImage('assets/images/login_img.png'),
          height: 200,
        ),
        SizedBox(height: 12),
        Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
