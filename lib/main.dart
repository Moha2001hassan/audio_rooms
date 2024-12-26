import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import 'core/helpers/screen_util.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/theme.dart';
import 'core/utils.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ZegoUIKit().init(appID: Utils.zegoAppID, appSign: Utils.zegoAppSign);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set the status bar color
    statusBarIconBrightness: Brightness.light, // Dark icons for a white background
    statusBarBrightness: Brightness.light, // For iOS (light background)
  ));

  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    ScreenUtil().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Audio Rooms',
      theme: MyAppTheme.lightTheme,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
