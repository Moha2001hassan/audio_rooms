class Room {
  final String hostId;
  final String hostName;
  final String imgUrl;
  final int usersNumber;

  Room({
    required this.hostName,
    required this.hostId,
    required this.imgUrl,
    this.usersNumber = 0,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      hostId: json['hostId'],
      hostName: json['hostName'],
      imgUrl: json['imgUrl'],
      usersNumber: json['usersNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hostId': hostId,
      'hostName': hostName,
      'imgUrl': imgUrl,
      'usersNumber': usersNumber,
    };
  }
}