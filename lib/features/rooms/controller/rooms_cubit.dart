import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth/data/models/user.dart';
import '../models/room.dart';
import 'rooms_controller.dart';
import 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  final RoomsController controller;

  RoomsCubit(this.controller) : super(RoomsInitial());

  List<Room> allRooms = [];
  MyUser? user;
  Room? userRoom;

  Future<void> initializePage() async {
    emit(RoomsLoading());
    try {
      user = await controller.getUserFromFirestore();
      allRooms = await controller.getRoomsFromFirestore();

      if (user != null) {
        userRoom = await controller.checkIfUserHasRoom(user!.userId);
      }

      emit(RoomsLoaded(user: user, userRoom: userRoom, rooms: allRooms));
    } catch (e) {
      emit(RoomsError('Failed to load data: $e'));
    }
  }

  void filterUsers(String query) {
    final filteredRooms = allRooms.where((room) {
      return room.hostId.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(RoomsLoaded(user: user, userRoom: userRoom, rooms: filteredRooms));
  }
}
