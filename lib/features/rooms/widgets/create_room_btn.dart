import 'package:flutter/material.dart';
import '../screens/live_audio_page.dart';

class CreateRoomBtn extends StatelessWidget {
  const CreateRoomBtn({
    super.key,
    this.roomId = '1234',
    this.userName = 'Mohamed Hassan',
    this.userId = 'userId01',
    this.isHost = true,
  });

  final String roomId, userName, userId;
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LiveAudioPage(
            roomId: roomId,
            isHost: isHost,
            userName: userName,
            userId: userId,
          );
        }));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text(
        'Create Your Room',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}