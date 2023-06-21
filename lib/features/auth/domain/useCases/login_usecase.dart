import 'package:dartz/dartz.dart';
import 'package:mini_project/features/auth/data/models/student_model.dart';

import '../../../../core/error/failures.dart';
import '../repositories/authRepository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<Failure, StudentModel>> call({required String email,required String password, required String type}) async {
    return await repository.login(email:email, password: password,type: type);
  }
}