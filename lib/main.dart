import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
import 'package:mini_project/core/widgets/loading_widget.dart';
import 'package:mini_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mini_project/features/auth/presentation/screens/get_started_screen.dart';
import 'package:mini_project/features/main_app/presentation/screens/home_screen.dart';
import 'package:mini_project/features/auth/presentation/screens/on_boarding_view.dart';
import 'package:mini_project/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mini_project/dependency_injection.dart' as di;

import 'core/messaging_service.dart';
import 'features/development_courses/presentation/bloc/development_courses_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print(fcmToken);

  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //     builder: (context) =>
      MyApp(showHome: showHome)
      // )

      );
}

class MyApp extends StatefulWidget {
  final bool showHome;

  const MyApp({Key? key, required this.showHome}) : super(key: key);

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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => di.sl<DevelopmentCoursesBloc>()
                  ..add(GetAllDevelopmentCoursesEvent()),
              ),
              BlocProvider<AuthBloc>(
                create: (_) =>
                    di.sl<AuthBloc>()..add(CheckIfTokenIsStoredEvent()),
              ),
            ],
            child: MaterialApp(
              // locale: DevicePreview.locale(context),
              //  builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              home: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state){
                  if (state is AuthError){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error,style: GoogleFonts.quicksand( fontWeight: FontWeight.w700, color: Colors.white)), backgroundColor: Colors.red, ));
                    // showDialog(context: context, builder: (context){
                    //   return Dialog(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius:BorderRadius.circular(20.0)),
                    //     child: Container(
                    //       constraints: BoxConstraints(maxHeight: 60.h),
                    //       child: Padding(
                    //         padding:  EdgeInsets.all(12.w),
                    //         child: Center(
                    //           child: Text(
                    //               state.error,
                    //               style: GoogleFonts.quicksand( fontWeight: FontWeight.w700,
                    //                   fontSize: 14,
                    //                   color: Colors.black,
                    //                   wordSpacing: 1)
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // });

                  } else if(state is Authenticated){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return const HomeScreen();
                    }));
                  }
                },
                builder: (context, state) {
                  if (state is Loading) {
                    return const LoadingWidget();
                  }else {
                    return
                      // widget.showHome ?const GetStartedScreen():
                      const OnBoardingView();
                  }
                },
              ),
            ),
          );
        });
  }
}
