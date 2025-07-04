import 'package:flutter/material.dart';

Widget background(String roomId, String roomName) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          'assets/images/room_bg.jpg',
          fit: BoxFit.cover,
        ),
      ),
       Positioned(
        top: 35,
        left: 0,
        right: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$roomName Room",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "ID: $roomId",
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}