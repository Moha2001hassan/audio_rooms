import 'package:flutter/material.dart';
import 'live_audio_page.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

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
          ],
        ),
      ),
    );
  }
}



