import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project/features/auth/data/models/student_model.dart';
import 'package:mini_project/features/auth/data/repositories/authRepositoryImpl.dart';
import 'package:mini_project/features/auth/domain/useCases/login_usecase.dart';
import 'package:mini_project/features/auth/domain/useCases/register_userInfo_usecase.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationRepository extends Mock implements AuthRepositoryImpl {}

void main() {
  group('LoginUseCase', () {

    late RegisterInfoUseCase registerInfoUseCase;

    late LoginUseCase loginUseCase;
    late MockAuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      registerInfoUseCase = RegisterInfoUseCase(repository: authenticationRepository);
      loginUseCase = LoginUseCase(repository: authenticationRepository);
    });

    test('should send successful result after successful login', (){

      const student = StudentModel(id: "648b122c00c941632d49380d", name: 'Tasnim', lastname: 'Tasnim', email: 'tasnim.hmida@gmail.com', phone: '23043201');

      when(authenticationRepository.login(email: student.email, password: '123456789', type: 'STUDENT')).thenAnswer((_) => Future.value(const Right(student)));

      final response = loginUseCase.call(email: student.email, password: '123456789', type: 'STUDENT');

      expect(response, equals(const Right(student)));
    });
  });
}
