import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';
import '../widgets/login_button.dart';
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
        body: ColorfulSafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                  color: onBoardingColorBeige,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              Image.asset(
                'lib/core/assets/images/getStarted.png',
                alignment: AlignmentDirectional.bottomCenter,
                height: 450,
              )
            ]),
            Text('Let\'s Get Started',
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600))),
            Column(
              children: [
                Text('Discover the ultimate education app.',
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ))),
                Text('Log in now for the best learning',
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))),
                Text('experience!',
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400))),
              ],
            ),
                Column(
                  children: [
                    LoginButton(loginFunction: (){
                      navigateToLoginScreen();
                    },),
                    const SizedBox(height: 15,),
                    SignUpButton(),
                  ],
                ),
                const SizedBox()
          ]),
        ));
  }

  navigateToLoginScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return const LoginScreen();
    }));
  }
}



