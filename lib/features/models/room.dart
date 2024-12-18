class Room {
  final String roomId;
  final String roomDesc;
  final String hostName;
  final String hostId;
  final String userName;
  final String imgUrl;
  final int usersNumber;

  Room({
    required this.roomId,
    required this.roomDesc,
    required this.hostName,
    required this.hostId,
    required this.userName,
    required this.imgUrl,
    this.usersNumber = 0,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomId: json['roomId'],
      roomDesc: json['roomDesc'],
      hostName: json['hostName'],
      hostId: json['hostId'],
      userName: json['userName'],
      imgUrl: json['imgUrl'],
      usersNumber: json['usersNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'roomDesc': roomDesc,
      'hostName': hostName,
      'hostId': hostId,
      'userName': userName,
      'imgUrl': imgUrl,
      'usersNumber': usersNumber,
    };
  }
}