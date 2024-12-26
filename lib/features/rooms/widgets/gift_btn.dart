import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import 'gift_bottom_sheet.dart';

class GiftBtn extends StatelessWidget {
  final String userName, hostName;

  const GiftBtn({super.key, required this.userName, required this.hostName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return GiftBottomSheet(
              onHourSelected: (selectedGift) {
                ZegoUIKitPrebuiltLiveAudioRoomController().message.send(
                    "$userName send a $selectedGift as a gift to $hostName just now!!");
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const ImageIcon(
          AssetImage('assets/icons/prize_icon.png'),
          size: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
