import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
import 'package:mini_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mini_project/features/auth/presentation/screens/register_screen.dart';
import 'package:mini_project/features/auth/presentation/widgets/blue_button.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../main_app/presentation/screens/home_screen.dart';
import '../widgets/input_field.dart';
import 'package:mini_project/dependency_injection.dart' as di;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.text = 'tasnim.hmida@gmail.com';
    _passwordController.text = '123456789';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AuthBloc>(),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<AuthBloc, AuthState> (
        listener: (context, state){
          if (state is AuthError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error,style: GoogleFonts.quicksand( fontWeight: FontWeight.w700, color: Colors.white)), backgroundColor: Colors.red, ));
          } else if (state is Authenticated){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return const HomeScreen();
            }));
          }
        },
        builder: (context, state){
          if (state is Loading) {
            return const LoadingWidget();
          }else {
            return Scaffold(
              backgroundColor: mainColorBlue,
              body: ColorfulSafeArea(
                bottom: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(80),
                      width: MediaQuery.of(context).size.width * .58,
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
                            'Login',
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
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(15),
                            horizontal: ScreenUtil().setWidth(34)),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                        ),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              // alignment: Alignment.center,
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Welcome Back !',
                                      style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.w600))),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(20),
                                  ),
                                  Text('Login to your account',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                            color: textColorGrey,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                          ))),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                InputField(
                                  controller: _emailController,
                                  inputLabel: 'Your Email',
                                  hintText: 'First.lastName@gmail.com',
                                  icon: 'lib/core/assets/icons/email.png',
                                  isPassword: false, marginBottom: 5.h,
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(20),
                                ),
                                InputField(
                                  controller: _passwordController,
                                  inputLabel: 'Password',
                                  hintText: '● ● ● ● ● ● ● ●',
                                  icon: 'lib/core/assets/icons/lock.png',
                                  isPassword: true, marginBottom: 5.h,),
                                SizedBox(
                                  height: ScreenUtil().setHeight(10),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: (){

                                      },
                                      child: Text('Forgot password?',
                                          style: GoogleFonts.quicksand(
                                              textStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: textColorGreyLight))),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(40),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                BlueButton(loginFunction: () { loginUser(context) ; }
                                , buttonWidth: 300.w, text: 'Login',),
                                SizedBox(
                                  height: ScreenUtil().setHeight(20),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Don’t have an account?',
                                        style: GoogleFonts.quicksand(
                                            textStyle: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: textColorGrey2))),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(10.w),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        navigateToRegisterScreen();
                                      },
                                      child: Text('Sign up',
                                          style: GoogleFonts.quicksand(
                                              textStyle: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ))),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(40),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      width: ScreenUtil().setWidth(97),
                                      child: const Divider(
                                        color: Color.fromARGB(100, 184, 184, 210),
                                        thickness: 2,
                                      )),
                                  SizedBox(width: 10.w,),
                                  Text("Or login with",
                                      style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: textColorGreyDark))),
                                  SizedBox(width: 10.w,),
                                  SizedBox(
                                      width: ScreenUtil().setWidth(97),
                                      child: const Divider(
                                        color: Color.fromARGB(100, 184, 184, 210),
                                        thickness: 2,
                                      )),
                                ]),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Image.asset(
                                    'lib/core/assets/icons/google.png',
                                    // height: 50,
                                  ),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(50)),
                                GestureDetector(
                                  child: Image.asset(
                                    'lib/core/assets/icons/facebook.png',
                                    // height: 50,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },

    );
  }

  void loginUser(context) {
    BlocProvider.of<AuthBloc>(context).add(SignInRequested(
        _emailController.text.trim(), _passwordController.text.trim()));
    // BlocProvider.of<AuthBloc>(context).add(CheckIfTokenIsStoredEvent());
  }

  // void forgotPassword(){
  //   BlocProvider.of<AuthBloc>(context).add(
  //
  //   )
  // }

  navigateToHomeScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomeScreen();
    }));
  }

  navigateToRegisterScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RegisterScreen();
    }));
  }
}
