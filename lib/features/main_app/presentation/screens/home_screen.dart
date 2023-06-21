import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/category_card.dart';
import '../widgets/text_divider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 2;
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildNavigationBar(),
      body: ColorfulSafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: homeScreenColorOrange,
                    radius: 28,
                    child: Image.asset(
                      'lib/core/assets/images/avatar.png',
                      fit: BoxFit.fill,
                      // height: 187,
                      // width: 156,
                    ),
                  ),
                  // NotificationBadge(totalNotifications: _totalNotifications),
                  Text(
                    'Hello ! Sabrine',
                    style: GoogleFonts.quicksand(
                        fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Image.asset('lib/core/assets/icons/cart.png',
                      color: mainColorBlue, height: ScreenUtil().setHeight(23))
                ],
              ),
              // SizedBox(),
              const TextDivider(text: 'Promotion'),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                height: 148.h,
                width: 339.w,
                child: PageView(
                  controller: controller,
                  children: [
                    buildPage(image: 'lib/core/assets/images/person.png'),
                    buildPage(image: 'lib/core/assets/images/woman.png'),
                    buildPage(image: 'lib/core/assets/images/happy_woman.png'),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                    spacing: 8,
                    dotHeight: 9.h,
                    dotWidth: 9.h,
                    dotColor: Color.fromARGB(255, 184, 184, 203),
                    activeDotColor: mainColorBlue),
              ),
              const TextDivider(text: 'Category'),
              // SizedBox(height: 20,),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: GridView.count(
                    childAspectRatio: (1),
                    primary: true,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 50.w,
                    mainAxisSpacing: 15.h,
                    children: [
                      for (var card in categoryContents)
                        buildCard(
                          text: card.text,
                          image: card.image,
                          context: context,
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Stack(
      children: [
        BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: mainColorBlue,
          unselectedItemColor: iconColorBlack,
          currentIndex: myCurrentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('lib/core/assets/icons/wishlist.png',
                    color:
                        myCurrentIndex == 0 ? mainColorBlue : iconColorBlack),
                label: 'Wishlist'),
            BottomNavigationBarItem(
                icon: Image.asset('lib/core/assets/icons/cart.png',
                    color:
                        myCurrentIndex == 1 ? mainColorBlue : iconColorBlack),
                label: 'Cart'),
            BottomNavigationBarItem(
              icon: Image.asset('lib/core/assets/icons/home.png',
                  color: myCurrentIndex == 2 ? mainColorBlue : iconColorBlack),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Image.asset('lib/core/assets/icons/notification.png',
                    color:
                        myCurrentIndex == 3 ? mainColorBlue : iconColorBlack),
                label: 'Notification'),
            BottomNavigationBarItem(
                icon: Image.asset('lib/core/assets/icons/user_home.png',
                    color:
                        myCurrentIndex == 4 ? mainColorBlue : iconColorBlack),
                label: 'Profile'),
          ],
          onTap: (newIndex) {
            setState(() {
              myCurrentIndex = newIndex;
            });
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            height: 2,
            color: Colors.blue, // Customize the color of the line here
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    color: myCurrentIndex == index ? const Color.fromARGB(255, 88, 47, 255) : Colors.white,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage({required image}) {
    return Container(
      decoration: BoxDecoration(
        color: onBoardingColorBeige,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(15),
                vertical: ScreenUtil().setHeight(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '50% Off',
                  style: GoogleFonts.quicksand(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      color: mainColorBlue),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'UI / UX DESIGN',
                  style: GoogleFonts.quicksand(
                      fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      'lib/core/assets/icons/video.png',
                      height: ScreenUtil().setHeight(18),
                    ),
                    Text(
                      '24 LESSON',
                      style: GoogleFonts.quicksand(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: textColorGrey4),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: Size(100.w, 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        foregroundColor: Colors.white,
                        backgroundColor: homeScreenColorOrange),
                    onPressed: () {},
                    child: Text('Enroll Now',
                        style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600, fontSize: 10.sp)))
              ],
            ),
          ),
          // SizedBox(
          //   width: 15.w,
          // ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Image.asset(
              'lib/core/assets/images/figma_logo.png',
              // alignment: Alignment.topCenter,
              // height: 56.h,
              // width: 42.w,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 22.h),
            child: Image.asset(
              image,
              // alignment: Alignment.centerLeft,
              // height: 150.h,
              width: 130.w,
            ),
          )
        ],
      ),
    );
  }
}
