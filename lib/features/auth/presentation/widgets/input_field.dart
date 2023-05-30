import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    required TextEditingController controller,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;

  final TextEditingController _controller = TextEditingController();

  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.inputLabel,
              textAlign: TextAlign.end,
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                color: textColorGrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ))),
          SizedBox(
            height: 2.h,
          ),
          TextFormField(
            controller: _controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              if (widget.inputLabel == 'Your Email') {
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
              }

              if(widget.isPassword){
                if (_controller.text.trim().length < 6){
                  return 'password must be at least 6 characters long';
                }
              }

              return null;
            },
            onChanged: (_) {
              _saveForm();
            },
            obscureText: widget.isPassword
                ? hidePassword
                    ? true
                    : false
                : false,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(18)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(18)),
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
                contentPadding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(16)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColorBlue),
                    borderRadius: BorderRadius.circular(18)),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400))),
          ),
        ],
      ),
    );
  }
}
