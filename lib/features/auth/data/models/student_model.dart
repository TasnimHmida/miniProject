import '../../domain/entities/student.dart';

class StudentModel extends Student {
  const StudentModel({
    required String? id,
    required String name,
    required String lastname,
    required String email,
    required String phone,


  }) : super(
    id : id,
    name: name,
    lastname: lastname,
    email: email,
    phone: phone,
  );

  factory StudentModel.fromJson(Map<String, dynamic > json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      lastname: json["lastname"],
      email: json["email"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id' : id,
      'name': name,
      'lastname': lastname,
      'email': email,
      'phone': phone,
    };
  }
}
