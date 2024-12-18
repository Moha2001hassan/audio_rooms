import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';

import 'core/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Start Live'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LiveAudioPage(
                    roomId: '1234',
                    isHost: true,
                    userName: 'Mohamed Hassan',
                    userId: 'userId01',
                  );
                }));
              },
            ),
            ElevatedButton(
              child: const Text('Watch Live'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LiveAudioPage(
                    roomId: '1234',
                    isHost: false,
                    userName: 'John Doe2',
                    userId: 'userId02',
                  );
                }));
              },
            ),
            // const LiveAudioPage(roomId: '1234'),
          ],
        ),
      ),
    );
  }
}

class LiveAudioPage extends StatelessWidget {
  const LiveAudioPage({
    super.key,
    required this.roomId,
    this.isHost = false,
    required this.userName,
    required this.userId,
  });

  final String roomId, userName, userId;
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: Utils.zegoAppID,
        appSign: Utils.zegoAppSign,
        userID: userId,
        userName: userName,
        roomID: roomId,
        config: isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
          ..userAvatarUrl = 'https://pixlr.com/images/index/ai-image-generator-one.webp'
          ..background = background(),
      ),
    );
  }
}

Widget background() {
  return const Stack(
    children: [
      Positioned(
          top: 10,
          left: 10,
          child: Text(
            "Live Audio Room",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff1B1B1B),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          )),
      Positioned(
        top: 10 + 20,
        left: 10,
        child: Text(
          "ID: roomID",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Color(0xff606060),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}