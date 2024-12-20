import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/my_appbar.dart';
import '../controller/rooms_controller.dart';
import '../models/room.dart';
import '../widgets/create_room_btn.dart';
import '../widgets/room_btn.dart';
import '../widgets/user_room.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  RoomsController controller = RoomsController();
  Room? userRoom;
  String? userId;

  @override
  void initState() {
    super.initState();
    getUserUid();
    checkRoomForUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          child: Column(
            children: [
              const RoomsAppBar(),
              if (userRoom == null) const CreateRoomBtn(),
              if (userRoom != null) UserRoomContainer(room: userRoom!),
              const Divider(),
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
                      imgUrl:
                          'https://pixlr.com/images/index/ai-image-generator-one.webp',
                      usersNumber: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getUserUid() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        setState(() => userId = user.uid);
      } else {
        debugPrint('No user is currently signed in.');
      }
    } catch (e) {
      debugPrint('Error retrieving user UID: $e');
    }
  }

  Future<void> checkRoomForUser() async {
    if (userId == null) return;
    Room? room = await controller.checkIfUserHasRoom(userId!);
    setState(() => userRoom = room);
  }
}
