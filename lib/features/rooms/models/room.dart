class Room {
  final String hostId;
  final String hostName;
  final String roomName;
  final String imgUrl;
  final int usersNumber;

  Room({
    required this.hostName,
    required this.roomName,
    required this.hostId,
    required this.imgUrl,
    this.usersNumber = 0,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      hostId: json['hostId'],
      hostName: json['hostName'],
      roomName: json['roomName'],
      imgUrl: json['imgUrl'],
      usersNumber: json['usersNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hostId': hostId,
      'hostName': hostName,
      'roomName': roomName,
      'imgUrl': imgUrl,
      'usersNumber': usersNumber,
    };
  }
}