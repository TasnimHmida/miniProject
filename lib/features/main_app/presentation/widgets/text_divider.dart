import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: GoogleFonts.quicksand(
              color: textColorBlue,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(20),
        ),
        Expanded(
            child: Divider(
              color: Colors.grey[200],
              thickness: 1.7,
            ))
      ],
    );
  }
}