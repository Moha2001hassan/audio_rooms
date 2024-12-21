import 'package:audio_rooms/core/helpers/navigation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/routing/routes.dart';
import '../../../../features/auth/view/widgets/forget_password_widget.dart';
import '../../data/remote/auth_firebase.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  FirebaseAuthService authService = FirebaseAuthService();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Email
            TextFormField(
              validator: (value) => value!.isEmpty ? 'EmptyField' : null,
              controller: email,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right, color: Colors.white),
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),

            // Password
            TextFormField(
              validator: (value) => value!.isEmpty ? 'EmptyField' : null,
              controller: password,
              keyboardType: TextInputType.visiblePassword,
              obscureText: !_isPasswordVisible,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
                prefixIcon:
                    const Icon(Iconsax.password_check, color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
                  onPressed: () {
                    setState(() => _isPasswordVisible = !_isPasswordVisible);
                  },
                ),
              ),
            ),
            const ForgetPasswordWidget(),

            // Sign In Button
            _isLoading
                ? const CircularProgressIndicator()
                : _buildLoginButton(),
            const SizedBox(height: 12),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => context.pushNamed(Routes.signupScreen),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  overlayColor: Colors.white,
                ),
                child: const Text('Create Account', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 23),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formState.currentState!.validate()) {
            setState(() => _isLoading = true);
            authService.login(context, email.text.trim(), password.text.trim());
          }
        },
        child: const Text('SignIn'),
      ),
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      controller: password,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Iconsax.password_check),
        suffixIcon: IconButton(
          icon: Icon(_isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
          onPressed: () {
            setState(() => _isPasswordVisible = !_isPasswordVisible);
          },
        ),
      ),
      validator: (value) => value!.isEmpty ? 'EmptyField' : null,
    );
  }
}
