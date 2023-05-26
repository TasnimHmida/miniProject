
import 'package:dartz/dartz.dart';
import 'package:mini_project/features/development_courses/domain/entities/development_courses.dart';

import '../../../../core/error/failures.dart';

abstract class DevelopmentCoursesRepository {
  Future<Either<Failure,List<DevelopmentCourse>>> getAllDevelopmentCourses();
}
