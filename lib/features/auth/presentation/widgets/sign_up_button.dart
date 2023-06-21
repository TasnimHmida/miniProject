import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class SignUpButton extends StatelessWidget {
  final signUpFunction;
  const SignUpButton({
    super.key, required this.signUpFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(

        style: TextButton.styleFrom(
          fixedSize: Size(250.w, 48.h),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: mainColorBlue, width: 1),
              borderRadius: BorderRadius.circular(16)),
          foregroundColor: mainColorBlue,
        ),
        onPressed: signUpFunction,
        child: Text(
          'Sign Up',
          style:
          GoogleFonts.quicksand(fontWeight: FontWeight.w600, fontSize: 16),
        ));
  }
}