class Room {
  final String hostId;
  final String hostUID;
  final String hostName;
  final String roomName;
  final String imgUrl;
  final int usersNumber;

  Room({
    required this.hostUID,
    required this.hostName,
    required this.roomName,
    required this.hostId,
    required this.imgUrl,
    this.usersNumber = 0,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      hostId: json['hostId'],
      hostUID: json['hostUID'],
      hostName: json['hostName'],
      roomName: json['roomName'],
      imgUrl: json['imgUrl'],
      usersNumber: json['usersNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hostId': hostId,
      'hostUID': hostUID,
      'hostName': hostName,
      'roomName': roomName,
      'imgUrl': imgUrl,
      'usersNumber': usersNumber,
    };
  }
}