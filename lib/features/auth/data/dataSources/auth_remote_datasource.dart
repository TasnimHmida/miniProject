import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_project/core/error/exceptions.dart';

import '../../../../core/pref_utils.dart';
import '../../domain/entities/userInfo.dart';
import '../models/student_model.dart';


abstract class AuthRemoteDataSource {
  Future<StudentModel> login({required String email, required String password, required String type});

  Future<Unit> registerUserInfo({required UserInfo userInfo});

  Future<Unit> forgetPassword({required String phone, required String type});

}

const baseUrl  = 'https://devstudenthelpapi.softylines.com';
var loginUrl = '$baseUrl/api/v1/login';
var signupUrl = '$baseUrl/api/v1/signup';
var forgetPasswordUrl = '$baseUrl/api/v1/forgetPassword';


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final PrefUtils prefUtils;
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client, required this.prefUtils});


  @override
  Future<StudentModel> login(
      {required String email, required String password, required String type}) async {
    final body = {
      'email': email,
      'password': password,
      'type': type,
    };

    final response = await client.post(Uri.parse(loginUrl), body: body);


    if (response.statusCode == 200) {

      final decodedJson = json.decode(response.body);
      prefUtils.setToken(decodedJson['data']['tokens']['accessToken']);
      final dataJson = decodedJson['data']['user'];
      return StudentModel.fromJson(dataJson);
    } else {
      final decodedJson = json.decode(response.body);
      throw AuthServerException(message: decodedJson['message']);
    }
  }


  @override
  Future<Unit> registerUserInfo({required UserInfo userInfo}) async {
    final body = {
      'name' : userInfo.name,
      'lastname' : userInfo.lastname,
      'email' : userInfo.email,
      'password' : userInfo.password,
      'passwordConfirm' : userInfo.passwordConfirm,
      'phone' : userInfo.phone,
      'type' : 'STUDENT'
    };

    final response = await client.post(
      headers: {
        'content-type' : 'application/json',
      },
       Uri.parse(signupUrl)
      ,body: jsonEncode(body)
    );
    print(response.body);


   if (response.statusCode == 200) {
     print('-----------');
     print(json.decode(response.body));
     final decodedJson = json.decode(response.body);
     return Future.value(unit);
   } else {
     final decodedJson = json.decode(response.body);
     throw AuthServerException(message: decodedJson['message']);
   }
  }

  @override
  Future<Unit> forgetPassword({required String phone, required String type}) async {
    final body = {
      'phone' : phone,
      'type' : type
    };
    final response = await client.post(
      headers: {
        'content-type' : 'application/json',
      },
      Uri.parse(forgetPasswordUrl),
      body: jsonEncode(body)
    );
    print('forget password response: ${response.statusCode}');
    if(response.statusCode == 200){
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  // @override
  // Future<Unit> logout() async {
  //   final token = await storage.read(key: 'token');
  //   final headers = {
  //     'authorization' : 'Bearer $token'
  //   };
  //
  //   final response = await client.delete(Uri.parse(logoutUrl))
  //
  // }
}