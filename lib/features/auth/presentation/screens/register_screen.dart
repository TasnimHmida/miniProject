import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/colors.dart';
import '../../../main_app/home_screen.dart';
import '../widgets/input_field.dart';
import '../widgets/login_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: mainColorBlue,
        body: ColorfulSafeArea(
          bottom: false,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    'Register',
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
                    horizontal: ScreenUtil().setWidth(27)),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Getting started! ✌️',
                        style: GoogleFonts.quicksand(
                            textStyle: TextStyle(
                                fontSize: 22.sp, fontWeight: FontWeight.w600))),
                    SizedBox(
                      height: ScreenUtil().setHeight(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Look like you are new to us! Create an',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                color: textColorGrey,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                              ))),
                          Text('account for a complete experience.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                color: textColorGrey,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                              ))),
                        ],
                      ),
                    ),
                    const InputField(
                      inputLabel: 'Your Name',
                      hintText: 'UserName',
                      icon: 'lib/core/assets/icons/user.png',
                      isPassword: false,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(75),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your Phone Number',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                color: textColorGrey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ))),
                          IntlPhoneField(
                            disableLengthCheck: true,
                            initialCountryCode: 'TN',
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: ScreenUtil().setWidth(10),
                                    vertical: ScreenUtil().setHeight(16)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(18)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: mainColorBlue),
                                    borderRadius: BorderRadius.circular(18)),
                                hintText: ' 50222800',
                                hintStyle: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400))),
                          ),
                        ],
                      ),
                    ),
                    const InputField(
                      inputLabel: 'Your Email',
                      hintText: 'First.lastName@gmail.com',
                      icon: 'lib/core/assets/icons/email.png',
                      isPassword: false,
                    ),
                    const InputField(
                        inputLabel: 'Password',
                        hintText: '* * * * * * * *',
                        icon: 'lib/core/assets/icons/lock.png',
                        isPassword: true),
                    const InputField(
                        inputLabel: 'Confirm Password',
                        hintText: '* * * * * * * * ',
                        icon: 'lib/core/assets/icons/lock.png',
                        isPassword: true),
                    const SizedBox(),
                    TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: Size(ScreenUtil().setWidth(320),
                                ScreenUtil().setHeight(48)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            foregroundColor: Colors.white,
                            backgroundColor: mainColorBlue),
                        onPressed: () {
                          navigateToHomeScreen();
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.sp),
                        )),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
  navigateToHomeScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }
}
