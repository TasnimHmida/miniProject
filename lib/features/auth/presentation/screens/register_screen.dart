import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/colors.dart';
import '../../../main_app/presentation/screens/home_screen.dart';
import '../widgets/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  passwordAndEmailConfirmed() {
    if (_passwordController.text.trim().isEmpty ||
        _confirmPasswordController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('no field should be empty'),
        backgroundColor: Colors.red,
      ));
      return false;
    }

    if (_passwordController.text.trim().length <= 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('password should be at least 6 characters long'),
        backgroundColor: Colors.red,
      ));
      return false;
    } else if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('passwords do not match'),
        backgroundColor: Colors.red,
      ));
      return false;
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(_emailController.text)){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('email is not valid'),
        backgroundColor: Colors.red,
      ));
      return false;
    } else {
      return true;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(15),
                    ScreenUtil().setWidth(20),
                    ScreenUtil().setHeight(5)),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: ListView(
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Getting started! ✌️',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w600))),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          // height: ScreenUtil().setHeight(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Looks like you are new to us! Create an',
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
                        SizedBox(
                          height: 10.h,
                        ),
                        InputField(
                          controller: _nameController,
                          inputLabel: 'Your Name',
                          hintText: 'UserName',
                          icon: 'lib/core/assets/icons/user.png',
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
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
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: mainColorBlue),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    hintText: ' 50222800',
                                    hintStyle: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400))),
                              ),
                            ],
                          ),
                        ),
                        InputField(
                          controller: _emailController,
                          inputLabel: 'Your Email',
                          hintText: 'First.lastName@gmail.com',
                          icon: 'lib/core/assets/icons/email.png',
                          isPassword: false,
                        ),
                        InputField(
                            controller: _passwordController,
                            inputLabel: 'Password',
                            hintText: '* * * * * * * *',
                            icon: 'lib/core/assets/icons/lock.png',
                            isPassword: true),
                        InputField(
                            controller: _confirmPasswordController,
                            inputLabel: 'Confirm Password',
                            hintText: '* * * * * * * * ',
                            icon: 'lib/core/assets/icons/lock.png',
                            isPassword: true),
                        SizedBox(
                          height: 30.h,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                fixedSize: Size(ScreenUtil().setWidth(320),
                                    ScreenUtil().setHeight(48)),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                foregroundColor: Colors.white,
                                backgroundColor: mainColorBlue),
                            onPressed: () {
                              if (passwordAndEmailConfirmed()) {
                                navigateToHomeScreen();
                              }
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.sp),
                            )),
                      ],
                    ),
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
