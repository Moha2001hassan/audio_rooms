import 'dart:math';

Future<String> generateUniqueUserId() async {
  final random = Random();
  int userId;
  userId = random.nextInt(900000) + 100000;
  return userId.toString();
}