
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/development_courses.dart';
import '../repositories/development_courses_repository.dart';

class GetAllDevelopmentCoursesUsecase{
  final DevelopmentCoursesRepository repository;
  GetAllDevelopmentCoursesUsecase(this.repository);

  Future<Either<Failure,List<DevelopmentCourse>>> call() async{
    return await repository.getAllDevelopmentCourses();
  }
}
