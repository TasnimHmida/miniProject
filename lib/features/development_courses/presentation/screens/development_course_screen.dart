import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
import 'package:mini_project/features/auth/presentation/widgets/blue_button.dart';
import 'package:mini_project/features/development_courses/domain/entities/development_courses.dart';
import 'package:mini_project/features/development_courses/presentation/widgets/course_app_bar.dart';

class DevelopmentCourseScreen extends StatefulWidget {
  final DevelopmentCourse developmentCourse;

  const DevelopmentCourseScreen({Key? key, required this.developmentCourse})
      : super(key: key);

  @override
  _DevelopmentCourseScreenState createState() =>
      _DevelopmentCourseScreenState();
}

class _DevelopmentCourseScreenState extends State<DevelopmentCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        child: Column(
          children: [
            const CourseAppBar(title: 'Details'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20.h, 11.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: const AssetImage(
                                  'lib/core/assets/images/video_image.png', ),
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                  Color.fromARGB(50, 190, 190, 190)
                                      .withOpacity(.8),
                                  BlendMode.modulate))),
                      child: Stack(children: [
                        Center(
                          child: Image.asset(
                            'lib/core/assets/icons/videoIcon.png',
                          ),
                        ),
                        Positioned(
                          right: 5.w,
                            bottom: 20.h,
                            child: Text(
                          'Introduction to \npython programing',
                          style: GoogleFonts.quicksand(
                              color: Colors.white,
                              fontSize: 17.81.sp,
                              fontWeight: FontWeight.w600),
                        ))
                      ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.w, ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * .65,
                                  child: Text(
                                    widget.developmentCourse.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  width: 75.w,
                                  padding: EdgeInsets.all(10.h),
                                  decoration: BoxDecoration(
                                    color: colorPurple,
                                    border: Border.all(color: mainColorBlue),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    '${widget.developmentCourse.id.toString()} Tnd',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'About Course',
                                  style: GoogleFonts.quicksand(
                                      fontSize: 17.81.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  widget.developmentCourse.body,
                                  style: GoogleFonts.quicksand(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:10.w),
                      child: BlueButton(
                          loginFunction: () {},
                          buttonWidth: 340.w,
                          text: 'Enroll'),
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
}
