import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {

  final String name;
  final String lastname;
  final String email;
  final String password;
  final String passwordConfirm;
  final String phone;
  final String type = 'STUDENT';

  const UserInfo(  {
    required this.name,
    required this.lastname,
    required this.email,
    required this.password ,
    required this.passwordConfirm,
    required this.phone,
  } );

  @override
  List<Object?> get props => [
    name, lastname, email, password, passwordConfirm, phone, type
  ];

}