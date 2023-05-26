import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/features/development_courses/presentation/screens/development_course_screen.dart';

import '../../../../core/colors.dart';
import '../../domain/entities/development_courses.dart';

class DevelopmentCoursesListWidget extends StatelessWidget {
  final List<DevelopmentCourse> developmentCourses;
  const DevelopmentCoursesListWidget({
    super.key, required this.developmentCourses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: developmentCourses.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DevelopmentCourseScreen(developmentCourse: developmentCourses[index]);
            }));
          },
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15.w),
                padding: EdgeInsets.symmetric(
                    vertical: 5.h, horizontal: 7.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: colorPurpleLight)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: colorPurple, width: 2.w)),
                          child: Image.asset(
                              'lib/core/assets/images/avatar.png'),
                        ),
                        SizedBox(width: 5.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(developmentCourses[index].title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                      ))),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(developmentCourses[index].body,
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
                    Row(
                      children: [
                        Image.asset(
                          'lib/core/assets/icons/star.png',
                          height: 15.h,
                          width: 15.w,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Text(developmentCourses[index].id.toString(),
                              style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                  ))),
                        )
                      ],
                    ),

                  ],
                ),
              ),
              Positioned(
                  top: 15.h,
                  right: 0,
                  child: Container(
                      height: 35.h,
                      width: 35.w,
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          boxShadow:  [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                            ),
                          ],
                          color: mainColorBlue,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: colorPurple, width: 2.w)),
                      child: Image.asset('lib/core/assets/icons/right_arrow.png'))

              )
            ],
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 15.h,);
    },
    );
  }
}