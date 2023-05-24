import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
import 'package:mini_project/features/auth/presentation/screens/get_started_screen.dart';
import 'package:mini_project/features/onboarding/data/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Discover The Best',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w500))),
              Text('Online Course',
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w500))),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                    });
                  },
                  children: [
                    for (var item in contents)
                      buildPage(
                          color: item.color,
                          urlImage: item.image,
                          desc1: item.desc1,
                          desc2: item.desc2)
                  ],
                ),
              ),
              isLastPage
                  ? TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(70.sp, 70.sp),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150)),
                          foregroundColor: Colors.white,
                          backgroundColor: onBoardingColorOrange),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('showHome', true);
                        navigateToGetStartedScreen(context);
                      },
                      child: Text(
                        'Go',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 23.sp),
                      ))
                  : TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: Size(70.sp, 70.sp),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150)),
                          foregroundColor: Colors.white,
                          backgroundColor: onBoardingColorOrange),
                      onPressed: () async {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        size: 35.sp,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPage(
      {required color, required urlImage, required desc1, required desc2}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(alignment: AlignmentDirectional.center, children: [
          Container(
            height: ScreenUtil().setHeight(360),
            width: ScreenUtil().setWidth(300),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Image.asset(
            urlImage,
            height: ScreenUtil().setHeight(310),
          )
        ]),
        Column(
          children: [
            Text(desc1,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 25.sp, fontWeight: FontWeight.w600))),
            Text(desc2,
                style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        fontSize: 25.sp, fontWeight: FontWeight.w600))),
          ],
        ),
        const SizedBox()
      ],
    );
  }

  void navigateToGetStartedScreen(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const GetStartedScreen();
    }));
  }
}
