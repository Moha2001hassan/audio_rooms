import 'package:audio_rooms/core/helpers/show_snack_bar.dart';
import 'package:audio_rooms/features/rooms/models/room.dart';
import 'package:flutter/material.dart';
import '../controller/rooms_controller.dart';
import '../screens/live_audio_page.dart';

class CreateRoomBtn extends StatelessWidget {
  const CreateRoomBtn({super.key, required this.room});

  final Room? room;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          room != null ? createRoomAndNavigate(context, room!) : () {};
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text(
          'Create Your Room',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

void createRoomAndNavigate(BuildContext context, Room room) async {
  try {
    // Save the room data
    await RoomsController().saveRoomData(room);

    // Navigate to the LiveAudioPage
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LiveAudioPage(
        roomId: room.hostId,
        isHost: true,
        userName: room.hostName,
        userId: room.hostId,
        roomName: room.roomName,
      );
    }));
  } catch (e) {
    showSnackBar('Failed to create room: $e', Colors.red, context);
  }
}
