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



  Future<void> subtractDollars(double amount) async {
    if (user == null) {
      emit(UserDollarsError('User not loaded'));
      return;
    }
    emit(UserDollarsLoading());

    final currentDollars = user!.dollarsNumber;
    if (currentDollars >= amount) {
      final newDollarsAmount = currentDollars - amount;
      final success = await controller.updateDollarsNumber(newDollarsAmount);

      if (success) {
        // Update local user object
        user = MyUser(
          userId: user!.userId,
          fullName: user!.fullName,
          email: user!.email,
          phoneNumber: user!.phoneNumber,
          dollarsNumber: newDollarsAmount,
          imageUrl: user!.imageUrl,
        );

        emit(UserDollarsUpdated(newDollarsAmount));
      } else {
        emit(UserDollarsError('Failed to update dollarsNumber in Firestore'));
      }
    } else {
      emit(UserDollarsError('Insufficient balance to subtract $amount dollars'));
    }
  }
}
