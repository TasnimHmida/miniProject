part of 'development_courses_bloc.dart';

@immutable
abstract class DevelopmentCoursesEvent {}

class GetAllDevelopmentCoursesEvent extends DevelopmentCoursesEvent {}

class RefreshDevelopmentCoursesEvent extends DevelopmentCoursesEvent {}

class SearchDevelopmentCoursesEvent extends DevelopmentCoursesEvent {
  final String searchKeyword;

  SearchDevelopmentCoursesEvent({required this.searchKeyword});
}
