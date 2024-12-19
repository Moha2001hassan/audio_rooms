import 'package:audio_rooms/core/helpers/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/handle_auth_error.dart';
import '../../../core/helpers/show_snack_bar.dart';
import '../../../core/routing/routes.dart';
import '../data/models/user.dart';
import '../data/remote/auth_firebase.dart';

class LoginData {
  FirebaseAuthService authService = FirebaseAuthService();

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        String userId = userCredential.user!.uid;
        MyUser? myUser = await authService.getUserFirestoreData(userId);
        await FirebaseAuthService().saveLoginStatus(true);

        if (myUser != null) {
          if (!context.mounted) return;
          context.pushNamedAndRemoveUntil(
            Routes.roomsPage,
            predicate: (route) => false,
          );
        } else {
          if (!context.mounted) return;
          showSnackBar('بيانات المستخدم غير موجودة', Colors.red, context);
        }
      } else if (userCredential.user == null) {
        if (!context.mounted) return;
        showSnackBar('emailOrPassNotTrue', Colors.red, context);
      } else {
        if (context.mounted) {
          showSnackBar('verifyYourEmail', Colors.green, context);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (!context.mounted) return;
      handleAuthError(e, context);
    }
  }
}
