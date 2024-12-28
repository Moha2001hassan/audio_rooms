import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import '../../../core/constants/constants.dart';
import '../../../core/utils.dart';
import '../controller/rooms_controller.dart';
import '../widgets/avatar_bg.dart';
import '../widgets/gift_btn.dart';

class LiveAudioPage extends StatefulWidget {
  const LiveAudioPage({
    super.key,
    required this.roomId,
    required this.userId,
    this.isHost = false,
    this.userAvatarUrl = constUserAvatar,
    required this.userName,
    required this.roomName,
    required this.hostUID,
  });

  final String roomId, userId, userName, roomName, hostUID;
  final String userAvatarUrl;
  final bool isHost;

  @override
  State<LiveAudioPage> createState() => _LiveAudioPageState();
}

class _LiveAudioPageState extends State<LiveAudioPage> {
  int _liveMemberCount = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    _liveMemberCount = ZegoUIKit().getAllUsers().length;
    RoomsController().updateUsersNumber(widget.roomId, _liveMemberCount);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveAudioRoom(
        appID: Utils.zegoAppID,
        appSign: Utils.zegoAppSign,
        userID: widget.userId,
        userName: widget.userName,
        roomID: widget.roomId,
        config: widget.isHost
            ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
            : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
          ..userAvatarUrl = widget.userAvatarUrl
          ..background = background(widget.roomId, widget.roomName)
          ..topMenuBar.buttons = [
            ZegoLiveAudioRoomMenuBarButtonName.minimizingButton,
            ZegoLiveAudioRoomMenuBarButtonName.leaveButton,
          ]
          ..bottomMenuBar.audienceExtendButtons = [
            GiftBtn(userName: widget.userName, hostName: widget.roomName, hostUID : widget.hostUID),
          ],
      ),
    );
  }
}
