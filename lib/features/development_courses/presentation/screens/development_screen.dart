import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_project/features/main_app/presentation/widgets/text_divider.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../bloc/development_courses_bloc.dart';
import '../widgets/course_app_bar.dart';
import '../widgets/development_courses_list_widget.dart';
import '../widgets/seach_courses_widget.dart';

class DevelopmentScreen extends StatefulWidget {
  const DevelopmentScreen({Key? key}) : super(key: key);

  @override
  _DevelopmentScreenState createState() => _DevelopmentScreenState();
}

class _DevelopmentScreenState extends State<DevelopmentScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Column(
            children: [
              const CourseAppBar(title: 'Development'),
              const SearchCoursesWidget(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: const TextDivider(text: 'Courses'),
              ),
              Expanded(
                child: BlocBuilder<DevelopmentCoursesBloc, DevelopmentCoursesState>(
                  builder: (context, state) {
                    if (state is LoadingDevelopmentCoursesState) {
                      return const LoadingWidget();
                    } else if (state is LoadedDevelopmentCoursesState) {
                      return RefreshIndicator(
                          onRefresh: () => _onRefresh(context),
                          child: DevelopmentCoursesListWidget(developmentCourses: state.developmentCourses));
                    } else if (state is ErrorDevelopmentCoursesState) {
                      return MessageDisplayWidget(message: state.message);
                    }
                    return const LoadingWidget();
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _onRefresh(BuildContext context) async {
  BlocProvider.of<DevelopmentCoursesBloc>(context).add(RefreshDevelopmentCoursesEvent());
}



