import '../../auth/data/models/user.dart';
import '../models/room.dart';

abstract class RoomsState {}

class RoomsInitial extends RoomsState {}

class RoomsLoading extends RoomsState {}

class RoomsLoaded extends RoomsState {
  final MyUser? user;
  final Room? userRoom;
  final List<Room> rooms;

  RoomsLoaded(
      {required this.user, required this.userRoom, required this.rooms});
}

class RoomsError extends RoomsState {
  final String message;

  RoomsError(this.message);
}

// Live Audio State
class UserDollarsLoading extends RoomsState {}

class UserDollarsUpdated extends RoomsState {
  final double updatedDollars;

  UserDollarsUpdated(this.updatedDollars);
}

class UserDollarsError extends RoomsState {
  final String message;

  UserDollarsError(this.message);
}
