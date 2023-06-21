import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/userInfo.dart';
import '../repositories/authRepository.dart';

class RegisterInfoUseCase {
  final AuthRepository repository;

  RegisterInfoUseCase({required this.repository});

  Future<Either<Failure, Unit>> call({required UserInfo userInfo}) async {
    return await repository.registerUserInfo(userInfo: userInfo);
  }
}