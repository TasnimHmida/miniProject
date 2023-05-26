part of 'development_courses_bloc.dart';

@immutable

abstract class DevelopmentCoursesState extends Equatable {
  const DevelopmentCoursesState();

  @override
  List<Object?> get props => [];
}

class DevelopmentCoursesInitial extends DevelopmentCoursesState {}

class LoadingDevelopmentCoursesState extends DevelopmentCoursesState {}

class LoadedDevelopmentCoursesState extends DevelopmentCoursesState {
  final List<DevelopmentCourse> developmentCourses;

  const LoadedDevelopmentCoursesState({required this.developmentCourses});

  @override
  List<Object?> get props => [developmentCourses];
}

class ErrorDevelopmentCoursesState extends DevelopmentCoursesState {
  final String message;

  const ErrorDevelopmentCoursesState({required this.message});

  @override
  List<Object?> get props => [message];
}
