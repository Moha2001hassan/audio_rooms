import 'package:flutter/material.dart';

void showSnackBarWithPop(
    String message, Color backgroundColor, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message), backgroundColor: backgroundColor),
  );
  Navigator.of(context).pop();
}

void showSnackBar(String message, Color backgroundColor, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
      backgroundColor: backgroundColor,
    ),
  );
}