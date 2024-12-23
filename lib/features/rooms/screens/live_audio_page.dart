import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import '../../../core/utils.dart';
import '../widgets/avatar_bg.dart';

class LiveAudioPage extends StatelessWidget {
  const LiveAudioPage({
    super.key,
    required this.roomId,
    required this.userId,
    this.isHost = false,
    this.userAvatarUrl = 'https://i.postimg.cc/mD5fYTJy/user.jpg',
    required this.userName,
    required this.roomName,
  });

  final String roomId, userId, userName, roomName;
  final String userAvatarUrl;
  final bool isHost;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: Utils.zegoAppID,
        appSign: Utils.zegoAppSign,
        userID: userId,
        userName: userName,
        roomID: '697622',
        config: isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
          ..userAvatarUrl = userAvatarUrl
          ..background = background(roomName, roomId)
          ..topMenuBar.buttons = [
            ZegoLiveAudioRoomMenuBarButtonName.minimizingButton,
            ZegoLiveAudioRoomMenuBarButtonName.leaveButton,
          ],
      ),
    );
  }
}
