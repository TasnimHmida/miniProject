import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_project/features/auth/presentation/screens/get_started_screen.dart';
import 'package:mini_project/features/auth/presentation/screens/login_screen.dart';
import 'package:mini_project/features/auth/presentation/screens/register_screen.dart';
import 'package:mini_project/features/development_courses/domain/entities/development_courses.dart';
import 'package:mini_project/features/development_courses/presentation/screens/development_course_screen.dart';
import 'package:mini_project/features/development_courses/presentation/screens/development_screen.dart';
import 'package:mini_project/features/main_app/presentation/screens/home_screen.dart';
import 'package:mini_project/features/auth/presentation/screens/on_boarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_project/dependency_injection.dart' as di;

import 'features/development_courses/presentation/bloc/development_courses_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //     builder: (context) =>
      MyApp(showHome: showHome)
    // )

  );
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
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocProvider(
            create: (_) => di.sl<DevelopmentCoursesBloc>()..add(GetAllDevelopmentCoursesEvent()),
            child: MaterialApp(
              // locale: DevicePreview.locale(context),
              //  builder: DevicePreview.appBuilder,
                debugShowCheckedModeBanner: false,
                home:
                // DevelopmentCourseScreen(developmentCourse: DevelopmentCourse(title: 'a very long title', body: 'a very very very looong description', id: 15),)
                // RegisterScreen()
                // LoginScreen()
                // HomeScreen()
                showHome? const GetStartedScreen() :
                const OnBoardingView(),
                // DevelopmentScreen()
            ),
          );
        });
  }
}
