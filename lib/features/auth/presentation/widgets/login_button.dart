
import 'package:flutter/material.dart';
import 'package:mini_project/features/auth/presentation/screens/login_screen.dart';

import '../../../../core/colors.dart';

class LoginButton extends StatelessWidget {
  final loginFunction;
  const LoginButton({
    super.key, required this.loginFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: const Size(250, 48),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)),
            foregroundColor: Colors.white,
            backgroundColor: mainColorBlue),
        onPressed: loginFunction,
        child: const Text(
          'Login',
          style:
          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ));
  }
}
