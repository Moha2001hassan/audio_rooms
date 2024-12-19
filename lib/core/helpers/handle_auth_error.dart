import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void handleAuthError(FirebaseAuthException e, BuildContext context) {
  String message;
  switch (e.code) {
    // registration errors
    case 'email-already-in-use':
      message = 'emailAlreadyUsed';
      break;
    case 'invalid-email':
      message = 'invalidEmail';
      break;
    case 'operation-not-allowed':
      message = 'Email/password accounts are not enabled.';
      break;
    case 'weak-password':
      message = 'weakPassword';
      break;
    // login errors
    case 'user-not-found':
      message = 'userNotExist';
      break;
    case 'wrong-password':
      message = 'incorrectPass';
      break;
    case 'user-disabled':
      message = 'This user has been disabled.';
      break;
    default:
      message = 'An unexpected error occurred. Please try again later.';
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: Colors.red),
  );
}
