import 'package:audio_rooms/core/helpers/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Forget Password
        TextButton(
          onPressed: () => context.pushNamed(Routes.forgetPassword),
          child: const Text(
            'Forget Password ?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
