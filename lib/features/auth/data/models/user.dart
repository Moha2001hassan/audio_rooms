class MyUser {
  final String userId;
  final String userUID;
  final String fullName;
  final String email;
  final String phoneNumber;
  final double dollarsNumber;
  final String? imageUrl;

  MyUser({
    required this.userId,
    required this.userUID,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.dollarsNumber,
    this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userUID': userUID,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'dollarsNumber': dollarsNumber,
      'imageUrl': imageUrl,
    };
  }

  factory MyUser.fromMap(Map<String, dynamic> map) {
    return MyUser(
      userId: map['userId'],
      userUID: map['userUID'],
      fullName: map['fullName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      dollarsNumber: map['dollarsNumber'].toDouble(),
      imageUrl: map['imageUrl'],
    );
  }
}