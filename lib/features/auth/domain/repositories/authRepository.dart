import 'package:dartz/dartz.dart';
import 'package:mini_project/core/error/failures.dart';
import 'package:mini_project/features/auth/domain/entities/userInfo.dart';

import '../../data/models/student_model.dart';


abstract class AuthRepository {
  Future<Either<Failure, StudentModel>> login(
      {required String email, required String password, required String type});
  Future< Either<Failure, Unit>> registerUserInfo({required UserInfo userInfo});

  Future<Either<Failure, Unit>> forgetPassword({required String phone, required String type});
}