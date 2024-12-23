import '../../auth/data/models/user.dart';
import '../models/room.dart';

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsLoaded extends RoomsState {
  final MyUser? user;
  final Room? userRoom;
  final List<Room> rooms;

  RoomsLoaded({required this.user, required this.userRoom, required this.rooms});
}

class RoomsError extends RoomsState {
  final String message;

  RoomsError(this.message);
}
