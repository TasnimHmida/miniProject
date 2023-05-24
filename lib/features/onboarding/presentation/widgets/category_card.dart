import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

Widget buildCard({required text, required image}){
  return
  Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: onBoardingColorBlue),
      borderRadius: BorderRadius.circular(11),
    ),
    child: Column(
      children: [
        Image.asset(
          image,
          height: ScreenUtil().setHeight(78),
          width: ScreenUtil().setWidth(78),
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 14.3,
              fontWeight: FontWeight.w300,
              color: textColorBlue),
        )
      ],
    ),
  );
}