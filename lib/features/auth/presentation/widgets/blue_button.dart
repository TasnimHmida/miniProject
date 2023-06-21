
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final loginFunction;
  const BlueButton({
    super.key, required this.loginFunction, required this.buttonWidth, required this.text
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: Size(buttonWidth, 44.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            foregroundColor: Colors.white,
            backgroundColor: mainColorBlue),
        onPressed: loginFunction,
        child:Text(
          text,
          style:
          GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16),
        ));
  }
}
