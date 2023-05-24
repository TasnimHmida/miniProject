import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      resizeToAvoidBottomInset: false,
      backgroundColor: mainColorBlue,
      body: ColorfulSafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: ScreenUtil().setHeight(80),
              width: MediaQuery.of(context).size.width * .6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Image.asset(
                        'lib/core/assets/icons/left_arrow.png',
                        height: ScreenUtil().setHeight(25),
                        width: ScreenUtil().setWidth(11),
                      )),
                  Text(
                    'Login',
                    style: GoogleFonts.quicksand(
                      fontSize: 20.sp,
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
                    vertical: ScreenUtil().setHeight(15),
                    horizontal: ScreenUtil().setWidth(34)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome Back !',
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w600))),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Text('Discover the ultimate education app.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                              color: textColorGrey,
                              fontSize: 17.sp,
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
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        const InputField(
                            inputLabel: 'Password',
                            hintText: 'enter password',
                            icon: 'lib/core/assets/icons/lock.png',
                            isPassword: true),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Text('Forgot password?',
                                  style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                          fontSize: 14.sp,
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
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account?',
                                style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: textColorGrey2))),
                            SizedBox(
                              width: ScreenUtil().setWidth(10),
                            ),
                            GestureDetector(
                              child: Text('Sign up',
                                  style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                    fontSize: 14.sp,
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
                          SizedBox(
                              width: ScreenUtil().setWidth(97),
                              child: const Divider(
                                color: textColorGrey3,
                                thickness: 2,
                              )),
                          Text("Or login with",
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: textColorGreyDark))),
                          SizedBox(
                              width: ScreenUtil().setWidth(97),
                              child: const Divider(
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
