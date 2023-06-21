import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/features/development_courses/presentation/screens/development_screen.dart';

import '../../../../core/colors.dart';

Widget buildCard({required text, required image, required context,}){

  return
  GestureDetector(
    onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const DevelopmentScreen();
        }));
    }
    ,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 221, 221, 255).withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
        border: Border.all(width: 1.4, color: onBoardingColorBlue),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 20.h,),
          Expanded(
            child: Image.asset(
              image,
              height: 78.1.h,
              width: 78.1.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom:8.h),
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: 14.3.sp,
                  fontWeight: FontWeight.w300,
                  color: textColorBlue),
            ),
          )
        ],
      ),
    ),
  );
}

class CategoryContents {
  final String image;
  final String text;

  CategoryContents({ required this.image, required this.text});
}

List<CategoryContents> categoryContents = [
  CategoryContents(
    image: 'lib/core/assets/images/laptop.png',
    text: 'Development',
  ),
  CategoryContents(
    image: 'lib/core/assets/images/design.png',
    text: 'Design',

  ),
  CategoryContents(
    image: 'lib/core/assets/images/trumpet.png',
    text: 'Music',

  ),
  CategoryContents(
    image: 'lib/core/assets/images/english.png',
    text: 'Language',

  ),
];

