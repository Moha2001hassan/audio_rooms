import 'package:audio_rooms/core/helpers/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/helpers/handle_auth_error.dart';
import '../../../../core/helpers/show_snack_bar.dart';
import '../../../../core/routing/routes.dart';
import '../models/user.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> login(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        String userId = userCredential.user!.uid;
        MyUser? myUser = await getUserFirestoreData(userId);
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

  Future<void> sendEmailVerification(User? user) async {
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    await saveLoginStatus(false);
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> saveUserData(User? user, Map<String, dynamic> userData) async {
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userData);
    }
  }

  Future<MyUser?> getUserFirestoreData(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists && snapshot.data() != null) {
        return MyUser.fromMap(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Error getting user data: $e');
      return null;
    }
  }
}
