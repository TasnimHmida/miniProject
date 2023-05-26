import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class SearchCoursesWidget extends StatelessWidget {
  const SearchCoursesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
          ),
          suffixIcon:
          Image.asset('lib/core/assets/icons/sliders.png'),
          contentPadding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(10),
              vertical: ScreenUtil().setHeight(16)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: colorPurple),
              borderRadius: BorderRadius.circular(57)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: mainColorBlue),
            borderRadius: BorderRadius.circular(57),
          ),
          hintText: 'Find your course',
          hintStyle: GoogleFonts.quicksand(
              textStyle: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.w300))),
    );
  }
}