import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_project/core/pref_utils.dart';
import 'package:mini_project/features/auth/presentation/screens/get_started_screen.dart';
import 'package:mini_project/features/main_app/presentation/screens/home_screen.dart';
import 'package:mini_project/features/auth/presentation/screens/on_boarding_view.dart';
import 'package:mini_project/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_project/dependency_injection.dart' as di;

import 'core/messaging_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcmToken = await FirebaseMessaging.instance.getToken();


  final prefUtils = di.sl<PrefUtils>();
  final isLoggedIn = prefUtils.getToken() != null;

  print(fcmToken);

  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //     builder: (context) =>
      MyApp(showHome: showHome, isLoggedIn: isLoggedIn)
      // )

      );
}

class MyApp extends StatefulWidget {
  final bool showHome;
  final bool isLoggedIn;

  const MyApp({Key? key, required this.showHome, required this.isLoggedIn}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final messagingService = MessagingService();

  @override
  void initState() {
    messagingService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
                // locale: DevicePreview.locale(context),
                //  builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                home:
                widget.isLoggedIn ? const HomeScreen() :
                widget.showHome
                    ? const GetStartedScreen()
                    : const OnBoardingView());
        });
  }
}
