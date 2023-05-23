import 'package:flutter/material.dart';

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
          fixedSize: const Size(250, 48),
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: mainColorBlue, width: 1),
              borderRadius: BorderRadius.circular(16)),
          foregroundColor: mainColorBlue,
        ),
        onPressed: signUpFunction,
        child: const Text(
          'Sign Up',
          style:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ));
  }
}