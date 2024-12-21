import 'package:flutter/material.dart';

import '../../features/auth/data/remote/auth_firebase.dart';
import '../../features/auth/view/widgets/logout_bottom_sheet.dart';

class RoomsAppBar extends StatelessWidget {
  const RoomsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(height: 32, 'assets/icons/audio_icon.png'),
        const Text(
          'Rooms',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            showConfirmLogoutBottomSheet(
              context,
              FirebaseAuthService().logout,
            );
          },
          icon: const Icon(Icons.logout, color: Colors.white),
          color: Colors.white,
        ),
      ],
    );
  }
}
