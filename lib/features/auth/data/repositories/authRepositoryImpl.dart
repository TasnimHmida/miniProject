import 'package:dartz/dartz.dart';
import 'package:mini_project/core/error/exceptions.dart';

import 'package:mini_project/core/error/failures.dart';
import 'package:mini_project/features/auth/data/dataSources/auth_remote_datasource.dart';
import 'package:mini_project/features/auth/data/models/userInfo_model.dart';

import 'package:mini_project/features/auth/domain/entities/userInfo.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/authRepository.dart';
import '../models/student_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authRemoteDataSource, required this.networkInfo
  });

  @override
  Future<Either<Failure, StudentModel>> login(
      {required String email, required String password, required String type}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin = await authRemoteDataSource.login(
            email: email,password: password,type: type);
        return Right(remoteLogin);
      } on AuthServerException catch (e){
        return Left(AuthServerFailure(message: e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> registerUserInfo(
      {required UserInfo userInfo}) async {
    final UserInfoModel userInfoModel = UserInfoModel(name: userInfo.name,
        lastname: userInfo.lastname,
        email: userInfo.email,
        password: userInfo.password,
        passwordConfirm: userInfo.passwordConfirm,
        phone: userInfo.phone);

    if (await networkInfo.isConnected) {
      try {
        final remoteRegisterUserInfo = await authRemoteDataSource.registerUserInfo(userInfo: userInfoModel);
        print('authRepositoryImpl no error');
        return Right(remoteRegisterUserInfo);
      } on AuthServerException catch (e){
        print('authRepositoryImpl exception ${e.message}');
        return Left(AuthServerFailure(message: e.message));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword(
      {required String phone, required String type}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteForgetPassword = await authRemoteDataSource.forgetPassword(phone: phone,type: type);
        return Right(remoteForgetPassword);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}