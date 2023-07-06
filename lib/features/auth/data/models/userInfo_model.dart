import '../../domain/entities/userInfo.dart';

class UserInfoModel extends UserInfo {
  const UserInfoModel({
    required String name,
    required String lastname,
    required String email,
    required String password,
    required String passwordConfirm,
    required String phone,
    String type = 'STUDENT',

  }) : super(
    name: name,
    lastname: lastname,
    email: email,
    password: password,
    passwordConfirm: passwordConfirm,
    phone: phone,
  );
  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      name: json['name'],
      lastname: json["lastname"],
      email: json["email"],
      password: json["password"],
      passwordConfirm: json["passwordConfirm"],
      phone: json["phone"],
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'phone': phone,
      'type': type,
    };
  }
}
