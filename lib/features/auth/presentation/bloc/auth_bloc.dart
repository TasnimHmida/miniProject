import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:mini_project/core/pref_utils.dart';
import 'package:mini_project/features/auth/data/models/userInfo_model.dart';
import 'package:mini_project/features/auth/domain/useCases/login_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/strings/failures.dart';
import '../../domain/useCases/forget_password_usecase.dart';
import '../../domain/useCases/register_userInfo_usecase.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final PrefUtils prefUtils;
  final FlutterSecureStorage storage;
  final LoginUseCase loginUseCase;
  final RegisterInfoUseCase registerUserInfoUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  AuthBloc({required this.loginUseCase, required this.forgetPasswordUseCase, required this.registerUserInfoUseCase, required this.storage, required this.prefUtils}) : super(UnAuthenticated()){

    on<CheckIfTokenIsStoredEvent>((event, emit) async {
      final token = prefUtils.getToken();
      emit(Loading());
      // if (token != null){
      //   emit(Authenticated());
      //   print('authenticated after CheckIfTokenIsStoredEvent');
      // } else {
      //   emit(UnAuthenticated());
      //   print('unauthenticated after CheckIfTokenIsStoredEvent');
      // }
    });

    on<SignInRequested>((event, emit) async {
      emit(Loading());
        final failureOrDoneMessage = await loginUseCase.call(email: event.email, password: event.password,type: event.type);
        emit(_eitherDoneOrErrorState(failureOrDoneMessage));
    });

    on<SignUpRequested>((event, emit) async {
      emit(Loading());
        final failureOrDoneMessage = await registerUserInfoUseCase.call(userInfo: UserInfoModel(name: event.name, lastname: event.lastName, email: event.email, password: event.password, passwordConfirm: event.confirmPassword, phone: event.phone));
        emit(_eitherDoneOrErrorState(failureOrDoneMessage));

    });
  }



  AuthState _eitherDoneOrErrorState(
      Either<Failure, dynamic> either) {
    return either.fold(
            (failure) => AuthError(
            error: _mapFailureToMessage(failure)!),
            (_) => Authenticated());
  }

  String? _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case AuthServerFailure:
        return failure.message;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error, please try again later';
    }
  }
}
