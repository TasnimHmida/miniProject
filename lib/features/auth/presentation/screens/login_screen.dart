import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
import 'package:mini_project/features/auth/presentation/widgets/login_button.dart';

import '../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorBlue,
      body: ColorfulSafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .1,
              padding: EdgeInsets.only(
                left: 10,
                  right: MediaQuery.of(context).size.width * .44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        'lib/core/assets/icons/left_arrow.png',
                        height: 25,
                        width: 11,
                      )),
                  Text(
                    'Login',
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .1),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Welcome Back !',
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600))),
                        const SizedBox(height: 20,),
                        Text('Discover the ultimate education app.',
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                              color: textColorGrey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ))),
                      ],
                    ),
                    Column(
                      children: [
                        const InputField(
                          inputLabel: 'Your Email',
                          hintText: 'First.lastName@gmail.com',
                          icon: 'lib/core/assets/icons/email.png',
                          isPassword: false,
                        ),
                        const SizedBox(height: 20,),
                        const InputField(
                            inputLabel: 'Password',
                            hintText: 'enter password',
                            icon: 'lib/core/assets/icons/lock.png',
                            isPassword: true),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Text('Forgot password?',
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: textColorGreyLight))),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        LoginButton(loginFunction: () {}),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account?',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: textColorGrey2))),
                            const SizedBox(width: 10,),
                            GestureDetector(
                              child: Text('Sign up',
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ))),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                              width: 97,
                              child: Divider(
                                color: textColorGrey3,
                                thickness: 2,
                              )),
                          Text("Or login with",
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: textColorGreyDark))),
                          const SizedBox(
                              width: 97,
                              child: Divider(
                                color: textColorGrey3,
                                thickness: 2,
                              )),
                        ]),
                    Image.asset(
                      'lib/core/assets/icons/google_and_facebook.png',
                      // height: 50,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
