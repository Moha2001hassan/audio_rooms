import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Image(image: AssetImage('assets/images/signup_img.png'), height: 200),
        SizedBox(height: 20),
        Text(
          'signupTitle',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22, color: Colors.white),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
