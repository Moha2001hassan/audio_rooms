import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppVersionCheckDialog extends StatelessWidget {
  final String currentAppVersion;

  const AppVersionCheckDialog({required this.currentAppVersion, super.key});

  Future<bool> isAppVersionValid() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('admin')
          .doc('adminId')
          .get();

      if (snapshot.exists) {
        final firestoreVersion = snapshot.data()?['appVersion'];
        return firestoreVersion == currentAppVersion;
      }
    } catch (e) {
      debugPrint('Error fetching app version: $e');
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isAppVersionValid(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final isVersionValid = snapshot.data ?? false;

        return AlertDialog(
          title: const Text('App Version Check'),
          content: isVersionValid
              ? const Text('Your app is up to date.')
              : const Text('Your app version is outdated. Please update to continue.'),
          actions: isVersionValid
              ? [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ]
              : null, // No action buttons if the version is invalid
        );
      },
    );
  }
}

void showVersionCheckDialog(BuildContext context, String currentAppVersion) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AppVersionCheckDialog(currentAppVersion: currentAppVersion),
  );
}
