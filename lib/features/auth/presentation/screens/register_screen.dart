import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mini_project/core/widgets/loading_widget.dart';
import 'package:mini_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mini_project/features/auth/presentation/screens/login_screen.dart';
import 'package:mini_project/features/auth/presentation/widgets/blue_button.dart';
import 'package:mini_project/features/auth/presentation/widgets/passwords_input_fields.dart';
import 'package:mini_project/dependency_injection.dart' as di;
import '../../../../core/colors.dart';
import '../../../development_courses/presentation/bloc/development_courses_bloc.dart';
import '../../../main_app/presentation/screens/home_screen.dart';
import '../widgets/input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();


  final _form = GlobalKey<FormState>();
  bool _isValid = false;

  void _saveForm() {
    setState(() {
      _isValid = _form.currentState!.validate();
    });
  }

  @override
  void initState() {
    _emailController.text = 'tasnim.hmida@gmail.com';
    _nameController.text = 'Tasnim';
    _phoneController.text = '23043201';
    _passwordController.text = '123456789';
    _confirmPasswordController.text = '123456789';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (_) => di.sl<AuthBloc>(),
  child: _buildBody(context),
);
  }

  Widget _buildBody(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is AuthError){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error,style: GoogleFonts.quicksand( fontWeight: FontWeight.w700, color: Colors.white)), backgroundColor: Colors.red, ));
    } else if (state is Authenticated){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return const LoginScreen();
      }));
    }
  },
  builder: (context, state) {
    if (state is Loading){
      return const LoadingWidget();
    } else {
      return Scaffold(
          backgroundColor: mainColorBlue,
          body: ColorfulSafeArea(
            bottom: false,
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: ScreenUtil().setHeight(80),
                width: MediaQuery.of(context).size.width * .6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          'lib/core/assets/icons/left_arrow.png',
                          height: ScreenUtil().setHeight(25),
                          width: ScreenUtil().setWidth(11),
                        )),
                    Text(
                      'Register',
                      style: GoogleFonts.quicksand(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(20),
                      ScreenUtil().setHeight(15),
                      ScreenUtil().setWidth(20),
                      ScreenUtil().setHeight(5)),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: ListView(
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Getting started! ✌️',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w600))),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            // height: ScreenUtil().setHeight(40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Looks like you are new to us! Create an',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          color: textColorGrey,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ))),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text('account for a complete experience.',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          color: textColorGrey,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ))),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          InputField(
                            controller: _nameController,
                            inputLabel: 'Your Name',
                            hintText: 'UserName',
                            icon: 'lib/core/assets/icons/user.png',
                            isPassword: false, marginBottom: 0.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(80),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Your Phone Number',
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          color: textColorGrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ))),
                                SizedBox(height: 5.h,),
                                IntlPhoneField(
                                  controller: _phoneController,
                                  disableLengthCheck: true,
                                  initialCountryCode: 'TN',
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: ScreenUtil().setWidth(10),
                                          vertical: ScreenUtil().setHeight(16)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[300]!),
                                          borderRadius:
                                          BorderRadius.circular(18)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: mainColorBlue),
                                          borderRadius:
                                          BorderRadius.circular(18)),
                                      hintText: ' 50222800',
                                      hintStyle: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400, color: const Color.fromARGB(255, 142, 142, 169)))),
                                ),
                                SizedBox(height: 7.h,)
                              ],
                            ),
                          ),
                          InputField(
                            controller: _emailController,
                            inputLabel: 'Your Email',
                            hintText: 'First.lastName@gmail.com',
                            icon: 'lib/core/assets/icons/email.png',
                            isPassword: false, marginBottom: 5.h,
                          ),
                          PasswordsInputFields(passwordController: _passwordController, confirmPasswordController: _confirmPasswordController),
                          SizedBox(
                            height: 10.h,
                          ),
                          BlueButton(loginFunction: () {
                            registerUserInfo(context);
                            // navigateToHomeScreen();
                          }, buttonWidth: 350.w, text: 'Sign Up')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ));
    }
  },
);
  }

  void registerUserInfo(context){
    BlocProvider.of<AuthBloc>(context).add(SignUpRequested(email: _emailController.text.trim(), password: _passwordController.text.trim(), name: _nameController.text.trim(), lastName: _nameController.text.trim(), phone: _phoneController.text.trim(), confirmPassword: _confirmPasswordController.text.trim()));
  }

  navigateToHomeScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }
}
