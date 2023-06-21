import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/features/development_courses/presentation/screens/development_course_screen.dart';

import '../../../../core/colors.dart';
import '../../domain/entities/development_courses.dart';

class DevelopmentCoursesListWidget extends StatefulWidget {
  final List<DevelopmentCourse> developmentCourses;

  const DevelopmentCoursesListWidget(
      {super.key, required this.developmentCourses});

  @override
  State<DevelopmentCoursesListWidget> createState() =>
      _DevelopmentCoursesListWidgetState();
}

class _DevelopmentCoursesListWidgetState
    extends State<DevelopmentCoursesListWidget> {
  List<DevelopmentCourse> allCourses = [];

  List<DevelopmentCourse> filteredProducts = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.developmentCourses.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DevelopmentCourseScreen(
                  developmentCourse: widget.developmentCourses[index]);
            }));
          },
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15.w),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 221, 221, 255).withOpacity(.2),
                        spreadRadius: .5,
                        blurRadius: 6,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: colorPurpleLight)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: colorPurple, width: 2.w)),
                          child:
                              Image.asset('lib/core/assets/images/avatar.png'),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child:
                                  Text(widget.developmentCourses[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                      ))),
                            ),
                            SizedBox(height: 7.h,),
                            SizedBox(
                              height: 15.h,
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(widget.developmentCourses[index].body,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.sp,
                                          color: textColorGrey4))),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        children: [
                          Image.asset(
                            'lib/core/assets/icons/star.png',
                            height: 15.h,
                            width: 15.w,
                          ),
                        SizedBox(width: 5.w,),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: Text(
                                widget.developmentCourses[index].id.toString(),
                                style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                ))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 22.h,
                  right: 5.w,
                  child: Container(
                      height: 26.h,
                      width: 30.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 221, 221, 255),
                              spreadRadius: 2,
                              blurRadius: 2,
                            ),
                          ],
                          color: mainColorBlue,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: colorPurple, width: 2.w)),
                      child:
                          Image.asset('lib/core/assets/icons/right_arrow.png')))
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 10.h,
        );
      },
    );
  }
}
