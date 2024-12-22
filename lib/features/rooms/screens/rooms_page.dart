import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/widgets/my_appbar.dart';
import '../../auth/data/models/user.dart';
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
  MyUser? user;
  List<Room> rooms = [];

  @override
  void initState() {
    super.initState();
    initializePage();
  }

  Future<void> initializePage() async {
    await getUser(); // Ensure `user` is fetched before checking the room
    await getRoomsList(); // Optionally run this in parallel if independent
    await checkRoomForUser(); // Now `user` is guaranteed to be non-null
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
              if (userRoom != null) UserRoomContainer(room: userRoom!),
              if (userRoom == null && user == null)
                const CreateRoomBtn(room: null),
              if (userRoom == null && user != null)
                CreateRoomBtn(
                  room: Room(
                    hostId: user!.userId,
                    hostName: user!.userId,
                    imgUrl: user!.imageUrl ?? '',
                  ),
                ),
              const Divider(),
              Expanded(
                child: GridView.builder(
                  itemCount: rooms.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of rooms per row
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                    childAspectRatio: 2 / 3,
                  ),
                  itemBuilder: (context, index) {
                    return user == null
                        ? RoomBtn(room: rooms[index], user: testUser)
                        : RoomBtn(room: rooms[index], user: user!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getRoomsList() async {
    final fetchedRooms = await controller.getRoomsFromFirestore();
    if (mounted) {
      setState(() {
        rooms = fetchedRooms;
      });
    }
  }

  Future<void> getUser() async {
    final fetchedUser = await controller.getUserFromFirestore();
    if (mounted) {
      setState(() {
        user = fetchedUser;
      });
    }
  }

  Future<void> checkRoomForUser() async {
    if (user != null) {
      final fetchedRoom = await controller.checkIfUserHasRoom(user!.userId);
      if (mounted) {
        setState(() {
          userRoom = fetchedRoom;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
