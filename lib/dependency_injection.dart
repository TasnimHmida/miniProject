import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mini_project/features/development_courses/presentation/bloc/development_courses_bloc.dart';

import 'core/network/network_info.dart';
import 'features/development_courses/data/data_sources/development_course_remote_datasource.dart';
import 'features/development_courses/data/repositories/development_courses_repository_impl.dart';
import 'features/development_courses/domain/repositories/development_courses_repository.dart';
import 'features/development_courses/domain/use_cases/get_all_development_courses.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
      () => DevelopmentCoursesBloc(getAllDevelopmentCourses: sl()));

  sl.registerLazySingleton(() => GetAllDevelopmentCoursesUsecase(sl()));

  sl.registerLazySingleton<DevelopmentCoursesRepository>(() => DevelopmentCoursesRepositoryImpl(
      remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
