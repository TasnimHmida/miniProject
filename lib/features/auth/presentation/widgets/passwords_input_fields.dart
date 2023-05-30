import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/colors.dart';

class PasswordsInputFields extends StatefulWidget {

  const PasswordsInputFields({
    super.key,
  });

  @override
  State<PasswordsInputFields> createState() => _PasswordsInputFieldsState();
}

class _PasswordsInputFieldsState extends State<PasswordsInputFields> {
  bool hidePassword = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(
            height: 2.h,
          ),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              if (_passwordController.text.trim().length < 6){
                return 'password must be at least 6 characters long';
              }

              return null;
            },
            onChanged: (_) {
              _saveForm();
            },
            obscureText: true
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
                hintText: '* * * * * * * *',
                hintStyle: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400))),
          ),  Text('Confirm Password',
              textAlign: TextAlign.end,
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                    color: textColorGrey,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ))),
          SizedBox(
            height: 2.h,
          ),TextFormField(
            controller: _confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }

              if (_passwordController.text.trim() != _confirmPasswordController.text.trim()){
                return 'passwords do not match';
              }

              return null;
            },
            onChanged: (_) {
              _saveForm();
            },
            obscureText: true
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
                hintText: '* * * * * * * *',
                hintStyle: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400))),
          ),
        ],
      ),
    );
  }
}
