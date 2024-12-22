import 'package:audio_rooms/features/auth/data/models/user.dart';
import 'package:flutter/material.dart';
import '../models/room.dart';
import '../screens/live_audio_page.dart';

class RoomBtn extends StatelessWidget {
  RoomBtn({
    super.key,
    required this.room,
    required this.user,
  });

  final Room room;
  final MyUser user;
  final borderColor = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: borderColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LiveAudioPage(
              roomId: user.userId,
              isHost: false,
              userName: user.fullName,
              userId: user.userId,
              userAvatarUrl: user.imageUrl ?? '',
            );
          }));
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.network(room.imgUrl,
                          width: double.infinity, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.person,
                                color: Colors.white, size: 20),
                            Text(
                              room.usersNumber.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        room.hostName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // Text(
                      //   room.roomDesc,
                      //   style:
                      //       const TextStyle(fontSize: 12, color: Colors.black),
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 1,
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
