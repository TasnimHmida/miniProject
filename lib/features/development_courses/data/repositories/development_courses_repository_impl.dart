import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/development_courses.dart';
import '../../domain/repositories/development_courses_repository.dart';
import '../data_sources/development_course_remote_datasource.dart';

class DevelopmentCoursesRepositoryImpl implements DevelopmentCoursesRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DevelopmentCoursesRepositoryImpl(
      {required this.remoteDataSource,
        required this.networkInfo});

  @override
  Future<Either<Failure, List<DevelopmentCourse>>> getAllDevelopmentCourses() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteDevelopmentCourses = await remoteDataSource.getAllDevelopmentCourses();
        return Right(remoteDevelopmentCourses);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
