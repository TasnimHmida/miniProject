import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class InputField extends StatefulWidget {
  final String inputLabel;
  final String hintText;
  final String icon;
  final bool isPassword;

  const InputField({
    super.key,
    required this.inputLabel,
    required this.hintText,
    required this.icon,
    required this.isPassword,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.inputLabel,
            textAlign: TextAlign.end,
            style: GoogleFonts.quicksand(
                textStyle: const TextStyle(
              color: textColorGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ))),
        const SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: widget.isPassword
              ? hidePassword
                  ? true
                  : false
              : false,
          decoration: InputDecoration(
              prefixIcon: Image.asset(
                widget.icon,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Image.asset(
                        'lib/core/assets/icons/hide_password.png',
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: textColorGreyLight),
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: mainColorBlue),
                  borderRadius: BorderRadius.circular(25)),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.quicksand(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w400))),
        ),
      ],
    );
  }
}
