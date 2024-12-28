import 'package:audio_rooms/core/helpers/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/helpers/helper.dart';
import '../../../../core/helpers/handle_auth_error.dart';
import '../../data/models/user.dart';
import '../../data/remote/auth_firebase.dart';
import 'build_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = FirebaseAuthService();

  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          buildTextField(
            controller: _nameController,
            labelText: 'Full Name',
            prefixIcon: Iconsax.user,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 12),
          // Phone Number
          buildTextField(
            controller: _phoneNumberController,
            labelText: 'Phone Number',
            prefixIcon: Iconsax.call,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          // Email
          buildTextField(
            controller: _emailController,
            labelText: 'Email',
            prefixIcon: Iconsax.direct,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          // Password
          buildPasswordField(),
          const SizedBox(height: 25),
          _isLoading ? const CircularProgressIndicator() : _buildSignUpButton(),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      cursorColor: Colors.blue,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Iconsax.password_check, color: Colors.white),
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
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

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _signUp();
          }
        },
        child: const Text('Create Account'),
      ),
    );
  }

  Future<void> _signUp() async {
    setState(() => _isLoading = true);
    try {
      UserCredential userCredential =
          await _authService.signUpWithEmailAndPassword(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      String userId = await generateUniqueUserId();
      MyUser newUser = MyUser(
        userId: userId,
        userUID: userCredential.user!.uid,
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
        dollarsNumber: 0,
      );

      await _authService.saveUserData(userCredential.user, newUser.toMap());
      await _authService.sendEmailVerification(userCredential.user);
      context.pop();
    } on FirebaseAuthException catch (e) {
      handleAuthError(e, context);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
