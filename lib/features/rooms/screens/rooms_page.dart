import 'package:flutter/material.dart';
import '../models/room.dart';
import '../widgets/create_room_btn.dart';
import '../widgets/room_btn.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: CreateRoomBtn(),
            ),
            // _______________________________________________________
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: 16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of rooms per row
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) => RoomBtn(
                  room: Room(
                    hostId: '123',
                    roomDesc: 'Live Audio Room Live Audio Room Live Audio Room',
                    hostName: 'John Doe',
                    roomId: '1234',
                    userName: 'John Doe',
                    imgUrl: 'https://pixlr.com/images/index/ai-image-generator-one.webp',
                    usersNumber: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
