import 'package:flutter/material.dart';

class MyElevatedBtnTheme {
  MyElevatedBtnTheme._();

  // light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Colors.white,
        fontFamily: 'Cairo',
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      overlayColor: Colors.white,
    ),
  );
}
