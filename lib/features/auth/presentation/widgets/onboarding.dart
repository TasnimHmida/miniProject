import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';

import '../screens/get_started_screen.dart';


Widget buildPage(
    {required color, required urlImage, required desc1, required desc2}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Stack(alignment: AlignmentDirectional.center, children: [
        Container(
          height: ScreenUtil().setHeight(360),
          width: ScreenUtil().setWidth(300),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Image.asset(
          urlImage,
          height: ScreenUtil().setHeight(310),
        )
      ]),
      Column(
        children: [
          Text(desc1,
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      fontSize: 25.sp, fontWeight: FontWeight.w600))),
          Text(desc2,
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      fontSize: 25.sp, fontWeight: FontWeight.w600))),
        ],
      ),
      const SizedBox()
    ],
  );
}

void navigateToGetStartedScreen(BuildContext context) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return const GetStartedScreen();
  }));
}





class OnBoardingContents {
  final Color color;
  final String image;
  final String desc1;
  final String desc2;

  OnBoardingContents(
      {required this.image, required this.desc1, required this.desc2, required this.color});
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    color: onBoardingColorBeige,
      image: 'lib/core/assets/images/onboarding1.png',
      desc1: 'Learn New',
      desc2: 'Things every day'),
  OnBoardingContents(
      color: onBoardingColorBlue,
      image: 'lib/core/assets/images/onboarding2.png',
      desc1: 'Transform Your',
      desc2: 'Knowledge into Expertise'),
  OnBoardingContents(
      color: onBoardingColorBeige,
      image: 'lib/core/assets/images/onboarding3.png',
      desc1: 'Build your',
      desc2: 'skills to the next level'),
];
