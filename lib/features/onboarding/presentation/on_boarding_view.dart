import 'package:flutter/material.dart';
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
      body: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * .08,
            top: MediaQuery.of(context).size.height * .15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Discover The Best',
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.w500))),
            Text('Online Course',
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.w500))),
            const SizedBox(
              height: 20,
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
                        fixedSize: const Size(80, 80),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150)),
                        foregroundColor: Colors.white,
                        backgroundColor: onBoardingColorOrange),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('showHome', true);
                     navigateToGetStartedScreen(context);
                    },
                    child: const Text(
                      'Go',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                    ))
                : TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(80, 80),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(150)),
                        foregroundColor: Colors.white,
                        backgroundColor: onBoardingColorOrange),
                    onPressed: () async {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 45,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(
      {required color, required urlImage, required desc1, required desc2}) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(alignment: AlignmentDirectional.center, children: [
            Container(
              height: MediaQuery.of(context).size.width * .8,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Image.asset(
              urlImage,
              height: 450,
            )
          ]),
          Spacer(),
          Column(
            children: [
              Text(desc1,
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600))),
              Text(desc2,
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600))),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToGetStartedScreen(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
          return const GetStartedScreen();
        }));
  }
}
