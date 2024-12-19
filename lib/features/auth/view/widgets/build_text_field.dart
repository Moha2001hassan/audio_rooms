import 'package:flutter/material.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String labelText,
  required IconData prefixIcon,
  TextInputType keyboardType = TextInputType.text,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon, color: Colors.white),
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    ),

    validator: (value) {
      // Check if the field is empty
      if (value == null || value.isEmpty) {
        return 'emptyField';
      }

      // Additional check for phone numbers
      if (keyboardType == TextInputType.phone) {
        final phoneRegex = RegExp(r'^\+\d{1,3}\d{7,15}$');
        if (!phoneRegex.hasMatch(value)) {
          return 'ادخال رقم الهاتف الصحيح مسبوق بكود الدوله';
        }
      }
      return null;
    },
  );
}
