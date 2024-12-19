import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/widgets/custom_button.dart';

Future<void> showBlockedUserDialog(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.block, size: 100, color: Colors.red),
              const SizedBox(height: 20),
              const Text(
                'انت محظور من استخدام التطبيق',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              const Text(
                'للاسف نحن مطرين الي اغلاق التطبيق',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'اغلاق التطبيق',
                onTap: () => closeApp(),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void closeApp() {
  Future.delayed(const Duration(milliseconds: 500), () {
    SystemNavigator.pop();
  });
}