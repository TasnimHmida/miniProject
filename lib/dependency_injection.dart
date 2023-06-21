import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mini_project/features/auth/data/dataSources/auth_remote_datasource.dart';
import 'package:mini_project/features/auth/data/repositories/authRepositoryImpl.dart';
import 'package:mini_project/features/auth/domain/repositories/authRepository.dart';
import 'package:mini_project/features/auth/domain/useCases/forget_password_usecase.dart';
import 'package:mini_project/features/auth/domain/useCases/login_usecase.dart';
import 'package:mini_project/features/auth/domain/useCases/register_userInfo_usecase.dart';
import 'package:mini_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mini_project/features/development_courses/presentation/bloc/development_courses_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/pref_utils.dart';
import 'features/development_courses/data/data_sources/development_course_remote_datasource.dart';
import 'features/development_courses/data/repositories/development_courses_repository_impl.dart';
import 'features/development_courses/domain/repositories/development_courses_repository.dart';
import 'features/development_courses/domain/use_cases/get_all_development_courses.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //BLOCS
  sl.registerFactory(() => DevelopmentCoursesBloc(getAllDevelopmentCourses: sl()));
  sl.registerFactory(() => AuthBloc(loginUseCase: sl(), forgetPasswordUseCase: sl(), registerUserInfoUseCase: sl(), storage: sl(), prefUtils: sl()));

  //USE CASES
  sl.registerLazySingleton(() => GetAllDevelopmentCoursesUsecase(sl()));

  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterInfoUseCase(repository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUseCase(repository: sl()));

  //REPOSITORIES
  sl.registerLazySingleton<DevelopmentCoursesRepository>(() =>
      DevelopmentCoursesRepositoryImpl(
          remoteDataSource: sl(), networkInfo: sl()));


  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(authRemoteDataSource: sl(), networkInfo: sl()));

  //DATA SOURCES
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: sl(), prefUtils: sl()));

  // EXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  sl.registerLazySingleton<PrefUtils>(() => PrefUtilsImpl(sharedPreferences: sl()));
  final flutterSecureStorage =  FlutterSecureStorage();
  sl.registerLazySingleton(() => flutterSecureStorage);

}
