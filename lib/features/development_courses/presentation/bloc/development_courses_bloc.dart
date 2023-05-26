
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/strings/failures.dart';
import '../../domain/entities/development_courses.dart';
import '../../domain/use_cases/get_all_development_courses.dart';

part 'development_courses_event.dart';
part 'development_courses_state.dart';

class DevelopmentCoursesBloc extends Bloc<DevelopmentCoursesEvent, DevelopmentCoursesState> {
  final GetAllDevelopmentCoursesUsecase getAllDevelopmentCourses;


  DevelopmentCoursesBloc({required this.getAllDevelopmentCourses}) : super(DevelopmentCoursesInitial()) {
    on<DevelopmentCoursesEvent>((event, emit) async {
      if (event is GetAllDevelopmentCoursesEvent || event is RefreshDevelopmentCoursesEvent) {
        emit(LoadingDevelopmentCoursesState());

        final failureOrDevelopmentCourses = await getAllDevelopmentCourses();
        failureOrDevelopmentCourses.fold(
                (failure) =>
            {emit(ErrorDevelopmentCoursesState(message: _mapFailureToMessage(failure)))},
                (developmentCourses) => {emit(LoadedDevelopmentCoursesState(developmentCourses: developmentCourses))});
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, please try again later';
    }
  }
}
