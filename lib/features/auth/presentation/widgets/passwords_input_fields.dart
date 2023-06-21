import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class PasswordsInputFields extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const PasswordsInputFields({
    required this.passwordController,
    required this.confirmPasswordController,
    super.key,
  });

  @override
  State<PasswordsInputFields> createState() => _PasswordsInputFieldsState();
}

class _PasswordsInputFieldsState extends State<PasswordsInputFields> {
  bool hidePassword = true;


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
          Text('Password',
              textAlign: TextAlign.end,
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    color: textColorGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            controller: widget.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              if (widget.passwordController.text.trim().length < 6){
                return 'password must be at least 6 characters long';
              }

              return null;
            },
            onChanged: (_) {
              _saveForm();
            },
            obscureText: hidePassword
                ,
            decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(18)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(18)),
                prefixIcon: Image.asset(
                  'lib/core/assets/icons/lock.png',
                ),
                suffixIcon: IconButton(
                  icon: Image.asset(
                    'lib/core/assets/icons/hide_password.png',
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(16)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColorBlue),
                    borderRadius: BorderRadius.circular(18)),
                hintText: '● ● ● ● ● ● ● ●',
                hintStyle: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 142, 142, 169)))),
          ),
          SizedBox(height: 5.h,),

          Text('Confirm Password',
              textAlign: TextAlign.end,
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    color: textColorGrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(
            height: 10.h,
          ),TextFormField(
            controller: widget.confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              if (widget.passwordController.text.trim() != widget.confirmPasswordController.text.trim()){
                return 'passwords do not match';
              }

              return null;
            },
            onChanged: (_) {
              _saveForm();
            },
            obscureText: hidePassword
                ,
            decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(18)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(18)),
                prefixIcon: Image.asset(
                  'lib/core/assets/icons/lock.png',
                ),
                suffixIcon: IconButton(
                  icon: Image.asset(
                    'lib/core/assets/icons/hide_password.png',
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setHeight(16)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(18)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: mainColorBlue),
                    borderRadius: BorderRadius.circular(18)),
                hintText: '● ● ● ● ● ● ● ●',
                hintStyle: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 142, 142, 169)))),
          ),
        ],
      ),
    );
  }
}
