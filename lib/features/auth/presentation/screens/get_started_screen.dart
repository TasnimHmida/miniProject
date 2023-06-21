import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/features/auth/presentation/screens/register_screen.dart';

import '../../../../core/colors.dart';
import '../widgets/blue_button.dart';
import '../widgets/sign_up_button.dart';
import 'login_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: ColorfulSafeArea(
          child:
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(alignment: AlignmentDirectional.center, children: [
                  Container(
                    height: ScreenUtil().setHeight(360),
                    width: ScreenUtil().setWidth(300),
                    decoration: BoxDecoration(
                      color: onBoardingColorBeige,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  Image.asset(
                    'lib/core/assets/images/getStarted.png',
                    height: ScreenUtil().setHeight(310),
                  )
                ]),
                Text('Let\'s Get Started',
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            fontSize: 25.sp, fontWeight: FontWeight.w600))),
                Column(
                  children: [
                    Text('Discover the ultimate education app.',
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ))),
                    Text('Log in now for the best learning',
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w400))),
                    Text('experience!',
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w400))),
                  ],
                ),
                Column(
                  children: [
                    BlueButton(
                      loginFunction: () {
                        navigateToLoginScreen();
                      }, buttonWidth: 250.w, text: 'Login',
                    ),
                    SizedBox(
                    height: ScreenUtil().setHeight(15),
                    ),
                    SignUpButton(
                      signUpFunction: () {
                        navigateToRegisterScreen();
                      },
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
          )
        ));
  }

  navigateToLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }));
  }

  navigateToRegisterScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RegisterScreen();
    }));
  }
}
