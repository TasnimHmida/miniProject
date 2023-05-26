import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class CourseAppBar extends StatelessWidget {
  final String title;
  const CourseAppBar({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: textColorGrey4,
            )),
        Spacer(),
        Text(
          title,
          style: GoogleFonts.quicksand(
              textStyle: TextStyle(
                  color: textColorBlue,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600)),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 25.w),
          child: Image.asset(
            'lib/core/assets/icons/cart.png',
            color: mainColorBlue,
          ),
        )
      ],
    );
  }
}