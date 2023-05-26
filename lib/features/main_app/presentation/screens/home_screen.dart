import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
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
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _buildNavigationBar(),
      body: ColorfulSafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10), vertical: ScreenUtil().setHeight(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: homeScreenColorOrange,
                    child: Image.asset(
                      'lib/core/assets/images/avatar.png',
                      height: ScreenUtil().setHeight(87),
                      width: ScreenUtil().setWidth(56),
                    ),
                  ),
                  Text(
                    'Hello ! Sabrine',
                    style: GoogleFonts.quicksand(
                        fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Image.asset('lib/core/assets/icons/cart.png',
                      color: mainColorBlue,
                      height: ScreenUtil().setHeight(23))
                ],
              ),
              SizedBox(),
              const TextDivider(text: 'Promotion'),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10),
                    horizontal: ScreenUtil().setWidth(10)),
                height: ScreenUtil().setHeight(160),
                width: ScreenUtil().setWidth(340),
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
                effect: const WormEffect(
                    spacing: 16,
                    dotColor: Color.fromARGB(255, 184, 184, 203),
                    activeDotColor: mainColorBlue),
              ),
              const TextDivider(text: 'Category'),
              // SizedBox(height: 20,),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  child: GridView.count(
                    childAspectRatio: (1 /.8),
                    primary: true,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: ScreenUtil().setWidth(40),
                    mainAxisSpacing: ScreenUtil().setHeight(10),
                    children: [
                      for (var card in categoryContents)
                        buildCard(text: card.text, image: card.image, context: context, )
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

  BottomNavigationBar _buildNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: mainColorBlue,
      unselectedItemColor: iconColorBlack,
      currentIndex: myCurrentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset('lib/core/assets/icons/wishlist.png',
                color: myCurrentIndex == 0 ? mainColorBlue : iconColorBlack),
            label: 'Wishlist'),
        BottomNavigationBarItem(
            icon: Image.asset('lib/core/assets/icons/cart.png',
                color: myCurrentIndex == 1 ? mainColorBlue : iconColorBlack),
            label: 'Cart'),
        BottomNavigationBarItem(
            icon: Image.asset('lib/core/assets/icons/home.png',
                color: myCurrentIndex == 2 ? mainColorBlue : iconColorBlack),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: Image.asset('lib/core/assets/icons/notification.png',
                color: myCurrentIndex == 3 ? mainColorBlue : iconColorBlack),
            label: 'Notification'),
        BottomNavigationBarItem(
            icon: Image.asset('lib/core/assets/icons/user_home.png',
                color: myCurrentIndex == 4 ? mainColorBlue : iconColorBlack),
            label: 'Profile'),
      ],
      onTap: (newIndex) {
        setState(() {
          myCurrentIndex = newIndex;
        });
      },
    );
  }

  Widget buildPage({required image}) {
    return Container(
      decoration: BoxDecoration(
        color: onBoardingColorBeige,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
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
                Text(
                  'UI / UX DESIGN',
                  style: GoogleFonts.quicksand(
                      fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: Size(ScreenUtil().setWidth(100),
                            ScreenUtil().setHeight(23)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        foregroundColor: Colors.white,
                        backgroundColor: homeScreenColorOrange),
                    onPressed: () {},
                    child: const Text(
                      'Enroll Now',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ))
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'lib/core/assets/images/figma_logo.png',
                height: ScreenUtil().setHeight(56),
                width: ScreenUtil().setWidth(42),
              ),
              Image.asset(
                image,
                height: ScreenUtil().setHeight(145),
                width: ScreenUtil().setWidth(118),
              ),
            ],
          )
        ],
      ),
    );
  }
}


