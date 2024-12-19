import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/helpers/screen_util.dart';
import 'features/rooms/screens/rooms_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return MaterialApp(
      title: 'Rooms App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const RoomsPage(),
    );
  }
}
