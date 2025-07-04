import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/show_snack_bar.dart';
import '../../auth/data/models/user.dart';
import '../models/room.dart';

class RoomsController {
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Room?> checkIfUserHasRoom(String userId) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('rooms')
          .doc(userId)
          .get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        return Room.fromJson(docSnapshot.data()!);
      } else {
        debugPrint('_______ Room not found.');
        return null;
      }
    } catch (e) {
      debugPrint('_____________ Error checking user room: $e');
      return null;
    }
  }

  Future<MyUser?> getUserFromFirestore() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists) {
        return MyUser.fromMap(doc.data()!);
      } else {
        debugPrint("User not found.");
        return null;
      }
    } catch (e) {
      debugPrint("Error getting user: $e");
      return null;
    }
  }

  Future<List<Room>> getRoomsFromFirestore() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('rooms').get();

      return querySnapshot.docs.map((doc) {
        return Room.fromJson(doc.data());
      }).toList();
    } catch (e) {
      debugPrint("Error getting rooms: $e");
      return [];
    }
  }

  Future<bool> saveRoomData(Room room) async {
    try {
      await _firestore.collection('rooms').doc(room.hostId).set(room.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> createRoom(BuildContext context, Room room) async {
    double userDollars = await getDollarsNumber() ?? 0.0;
    if (userDollars >= 15) {
      // Minus the room price from the user's dollars
      var update = await updateDollarsNumber(userDollars - 15);
      if(update == false) {
        showSnackBar("حدثت مشكله غير متوقعة", Colors.red, context);
        return false;
      } else {
        // Save the room data
        await saveRoomData(room);
        showSnackBar("تم إنشاء الغرفة بنجاح", Colors.green, context);
        return true;
      }
    } else {
      showSnackBar("للاسف رصيدك اقل من 15 دولار", Colors.red, context);
      return false;
    }
  }

  Future<void> updateUsersNumber(String roomId, int newUsersNumber) async {
    try {
      final roomRef = _firestore.collection('rooms').doc(roomId);

      await roomRef.update({'usersNumber': newUsersNumber});
      debugPrint('usersNumber updated successfully.');
    } catch (e) {
      debugPrint('Failed to update usersNumber: $e');
    }
  }

  Future<double?> getDollarsNumber() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final userDoc = await firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          final user = MyUser.fromMap(userData);
          return user.dollarsNumber;
        }
      }
      return null;
    } catch (e) {
      debugPrint('Error fetching dollarsNumber: $e');
      return null;
    }
  }

  Future<bool> updateDollarsNumber(double newDollarsAmount) async {
    try {
      final firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(uid).update({
        'dollarsNumber': newDollarsAmount,
      });
      return true;
    } catch (e) {
      debugPrint('Error updating dollarsNumber: $e');
      return false;
    }
  }

  Future<double?> getHostDollarsNumber(String hostUID) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final userDoc = await firestore.collection('users').doc(hostUID).get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          final user = MyUser.fromMap(userData);
          return user.dollarsNumber;
        }
      }
      return null;
    } catch (e) {
      debugPrint('Error fetching dollarsNumber: $e');
      return null;
    }
  }

  Future<bool> updateHostDollarsNumber(double newDollars, String hostUID) async {
    try {
      final firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(hostUID).update({
        'dollarsNumber': newDollars,
      });
      return true;
    } catch (e) {
      debugPrint('Error updating dollarsNumber: $e');
      return false;
    }
  }

}
