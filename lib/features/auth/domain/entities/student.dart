import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final String? id;
  final String name;
  final String lastname;
  final String email;
  final String phone;

  const Student({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
  });

  @override
  List<Object?> get props => [id, name, lastname, email, phone];
}
