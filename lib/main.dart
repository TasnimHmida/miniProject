import 'package:flutter/material.dart';
import 'package:mini_project/features/auth/presentation/screens/get_started_screen.dart';
import 'package:mini_project/features/auth/presentation/screens/login_screen.dart';
import 'package:mini_project/features/onboarding/presentation/on_boarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome
}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showHome? GetStartedScreen() : OnBoardingView(),
    );
  }
}
