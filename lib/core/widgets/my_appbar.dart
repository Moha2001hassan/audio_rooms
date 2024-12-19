import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Live'),
      backgroundColor: Colors.lightBlue,
      centerTitle: true,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}