import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/constants.dart';
import '../../../core/widgets/my_appbar.dart';
import '../../auth/data/models/user.dart';
import '../controller/rooms_controller.dart';
import '../controller/rooms_cubit.dart';
import '../controller/rooms_state.dart';
import '../models/room.dart';
import '../widgets/create_room_btn.dart';
import '../widgets/room_btn.dart';
import '../widgets/search_widget.dart';
import '../widgets/user_room.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  late RoomsCubit roomsCubit;
  final TextEditingController searchController = TextEditingController();
  MyUser? user; // To store user data
  Room? userRoom; // To store user room

  @override
  void initState() {
    super.initState();
    roomsCubit = RoomsCubit(RoomsController());
    roomsCubit.initializePage();
    roomsCubit.stream.listen((state) {
      if (state is RoomsLoaded) {
        setState(() {
          user = state.user;
          userRoom = state.userRoom;
        });
      }
    });
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
              SearchWidget(
                roomsCubit: roomsCubit,
                searchController: searchController,
              ),
              const SizedBox(height: 5),
              if (userRoom != null) UserRoomContainer(room: userRoom!),
              if (userRoom == null && user == null)
                const CreateRoomBtn(room: null),
              if (userRoom == null && user != null)
                CreateRoomBtn(
                  room: Room(
                    hostId: user!.userId,
                    hostUID: user!.userUID,
                    hostName: user!.fullName,
                    roomName: user!.fullName,
                    imgUrl: user!.imageUrl ?? constUserAvatar,
                  ),
                ),
              const Divider(),
              Expanded(
                child: BlocBuilder<RoomsCubit, RoomsState>(
                  bloc: roomsCubit,
                  builder: (context, state) {
                    if (state is RoomsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is RoomsLoaded) {
                      if (state.rooms.isEmpty) return const EmptyRooms();
                      return GridView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: state.rooms.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          childAspectRatio: 2 / 3,
                        ),
                        itemBuilder: (context, index) {
                          return RoomBtn(
                            room: state.rooms[index],
                            user: state.user ?? testUser,
                          );
                        },
                      );
                    } else if (state is RoomsError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    roomsCubit.close();
    searchController.dispose();
    super.dispose();
  }
}

class EmptyRooms extends StatelessWidget {
  const EmptyRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No rooms found',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
