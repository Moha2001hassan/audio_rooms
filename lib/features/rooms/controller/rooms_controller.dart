import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/room.dart';

class RoomsController {
  Future<Room?> checkIfUserHasRoom(String userId) async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('rooms')
          .doc(userId)
          .get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        return Room.fromJson(docSnapshot.data()!);
      }
      return null; // Return null if the document doesn't exist or has no data
    } catch (e) {
      debugPrint('Error checking user room: $e');
      return null;
    }
  }
}
