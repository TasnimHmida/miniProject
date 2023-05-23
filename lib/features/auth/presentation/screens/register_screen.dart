import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/colors.dart';
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
        backgroundColor: mainColorBlue,
        body: ColorfulSafeArea(
          bottom: false,
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * .1,
              padding: EdgeInsets.only(
                  left: 10, right: MediaQuery.of(context).size.width * .44),
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
                    'Register',
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
                    vertical: MediaQuery.of(context).size.height * .02,
                    horizontal: MediaQuery.of(context).size.width * .1),
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
                            textStyle: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600))),
                    Text(
                        'Look like you are new to us! Create an account for a complete experience.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                          height: 2,
                          color: textColorGrey,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ))),
                    const InputField(
                      inputLabel: 'Your Name',
                      hintText: 'UserName',
                      icon: 'lib/core/assets/icons/user.png',
                      isPassword: false,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your Phone Number',
                            textAlign: TextAlign.end,
                            style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                              color: textColorGrey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ))),
                        const SizedBox(
                          height: 10,
                        ),
                        IntlPhoneField(
                          initialCountryCode: 'TN',
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 25),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: textColorGreyLight),
                                  borderRadius: BorderRadius.circular(25)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: mainColorBlue),
                                  borderRadius: BorderRadius.circular(25)),
                              hintText: ' 50222800',
                              hintStyle: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w400))),
                        ),
                      ],
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
                    const SizedBox(height: 10,),
                    TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: Size(MediaQuery.of(context).size.width * .8, 48),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            foregroundColor: Colors.white,
                            backgroundColor: mainColorBlue),
                        onPressed: (){},
                        child: const Text(
                          'Sign Up',
                          style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                        )),
                  ],
                ),
              ),
            ),
          ]),
        ));
  }
}
