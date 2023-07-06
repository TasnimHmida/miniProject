import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/features/main_app/presentation/widgets/text_divider.dart';

import '../../../../core/colors.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../bloc/development_courses_bloc.dart';
import '../widgets/course_app_bar.dart';
import '../widgets/development_courses_list_widget.dart';
import 'package:mini_project/dependency_injection.dart' as di;

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {
  int myCurrentIndex = 2;
  final TextEditingController _searchKeyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      di.sl<DevelopmentCoursesBloc>()
        ..add(GetAllDevelopmentCoursesEvent()),
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildNavigationBar(),
      body:
      ColorfulSafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            children: [
              const CourseAppBar(title: 'Development'),
              TextField(
                controller: _searchKeyword,
                // onChanged: _onChange(context, _searchKeyword.text.trim()),
                decoration: InputDecoration(
                    prefixIcon: IconButton(
                      icon: Image.asset('lib/core/assets/icons/search.png'),
                      onPressed: () {
                        _onChange(context, _searchKeyword.text.trim());
                      },
                    ),
                    suffixIcon:
                    Image.asset('lib/core/assets/icons/sliders.png'),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10),
                        vertical: 12.h),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(225, 189, 189, 225)),
                        borderRadius: BorderRadius.circular(57)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: mainColorBlue),
                      borderRadius: BorderRadius.circular(57),
                    ),
                    hintText: 'Find your course',
                    hintStyle: GoogleFonts.quicksand(
                        textStyle: TextStyle(
                            color: const Color.fromARGB(255, 176, 176, 176),
                            fontSize: 16.sp, fontWeight: FontWeight.w300))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: const TextDivider(text: 'Courses'),
              ),
              Expanded(child:
              BlocBuilder<DevelopmentCoursesBloc, DevelopmentCoursesState>(
                builder: (context, state) {
                  if (state is LoadingDevelopmentCoursesState) {
                    return const LoadingWidget();
                  } else if (state is LoadedDevelopmentCoursesState) {
                    return RefreshIndicator(
                        onRefresh: () {
                          setState(() {
                            _searchKeyword.text = '';
                          });
                          return _onRefresh(context);
                        },
                        child: DevelopmentCoursesListWidget(
                            developmentCourses: state.developmentCourses));
                  } else if (state is ErrorDevelopmentCoursesState) {
                    return MessageDisplayWidget(message: state.message);
                  }
                  return const LoadingWidget();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _buildNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
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
}

Future<void> _onRefresh(BuildContext context) async {
  context.read<DevelopmentCoursesBloc>().add(RefreshDevelopmentCoursesEvent());
}

_onChange(BuildContext context, String searchKeyword) async {
  context.read<DevelopmentCoursesBloc>().add(SearchDevelopmentCoursesEvent(searchKeyword: searchKeyword));
}
