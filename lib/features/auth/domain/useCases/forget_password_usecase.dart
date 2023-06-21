import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/authRepository.dart';

class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<Either<Failure, Unit>> call( String phone,String type) async {
    return await repository.forgetPassword(phone: phone,type: type);
  }
}