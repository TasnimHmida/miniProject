import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/core/colors.dart';
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
            CourseAppBar(title: 'Details'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('lib/core/assets/images/video_image.png'),

                    SizedBox(
                      height: MediaQuery.of(context).size.height*.4,
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
                                      fontSize: 14.sp, fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.h),
                                decoration: BoxDecoration(
                                  color: colorPurple,
                                  border: Border.all(color: mainColorBlue),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  '${widget.developmentCourse.id.toString()} Tnd',
                                  style: GoogleFonts.quicksand(
                                      fontSize: 14.sp, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.h,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'About Course',
                                style: GoogleFonts.quicksand(
                                    fontSize: 17.81.sp, fontWeight: FontWeight.w600),
                              ),SizedBox(height: 20.h,),

                              Text(
                                widget.developmentCourse.body,
                                style: GoogleFonts.quicksand(
                                    fontSize: 14.sp, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                TextButton(
                    style: TextButton.styleFrom(
                        fixedSize: const Size(250, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        foregroundColor: Colors.white,
                        backgroundColor: mainColorBlue),
                    onPressed: (){},
                    child: const Text(
                      'Enroll',
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ))
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
