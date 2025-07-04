import 'package:flutter/material.dart';

import '../models/room.dart';
import '../screens/live_audio_page.dart';
import 'edit_room_bottom_sheet.dart';

class UserRoomContainer extends StatelessWidget {
  const UserRoomContainer({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LiveAudioPage(
                    roomId: room.hostId,
                    isHost: true,
                    userName: room.hostName,
                    roomName: room.roomName,
                    userId: room.hostId,
                    hostUID: room.hostUID,
                    userAvatarUrl: room.imgUrl,
                  );
                }));
              },
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 85,
                width: double.infinity * 0.6,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 17),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          Text(
                            room.roomName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            room.hostId,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.person, color: Colors.white, size: 20),
                  Text(
                    room.usersNumber.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -26,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  room.imgUrl,
                  fit: BoxFit.cover,
                  width: 54,
                  height: 54,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  builder: (context) => EditRoomBottomSheet(room: room),
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
