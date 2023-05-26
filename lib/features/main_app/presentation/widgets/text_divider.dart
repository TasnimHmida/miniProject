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
        const Expanded(
            child: Divider(
              thickness: .5,
            ))
      ],
    );
  }
}