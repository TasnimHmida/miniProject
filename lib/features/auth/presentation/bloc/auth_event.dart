part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;
  final String type = 'STUDENT';

  SignInRequested(this.email, this.password);
}

class CheckIfTokenIsStoredEvent extends AuthEvent {}

class SignUpRequested extends AuthEvent {
  final String name;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final String type = 'STUDENT';

  SignUpRequested({required this.email, required this.password, required this.name, required this.lastName, required this.phone, required this.confirmPassword});
}



class SignOutRequested extends AuthEvent {}