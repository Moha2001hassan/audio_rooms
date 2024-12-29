import 'package:audio_rooms/core/helpers/show_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/room.dart';

class EditRoomBottomSheet extends StatelessWidget {
  const EditRoomBottomSheet({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final nameController = TextEditingController(text: room.roomName);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: mediaQuery.viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'تعديل الغرفة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const Divider(),
            const SizedBox(height: 10),

            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'اسم الغرفة',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final newRoomName = nameController.text.trim();
                if (newRoomName.isNotEmpty) {
                  await updateRoomName(room.hostId, newRoomName);
                  showSnackBar("تم تحديث اسم الغرفة", Colors.green, context);
                  Navigator.pop(context); // Close the bottom sheet
                } else {
                  showSnackBar("اسم الغرفة لا يمكن أن يكون فارغًا", Colors.red, context);
                }
              },
              child: const Text('تحديث'),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

Future<void> updateRoomName(String roomId, String roomName) async {
  try {
    await FirebaseFirestore.instance.collection('rooms').doc(roomId).update({
      'roomName': roomName,
    });
    debugPrint("Room name updated successfully.");
  } catch (e) {
    debugPrint("Failed to update room name: $e");
  }
}