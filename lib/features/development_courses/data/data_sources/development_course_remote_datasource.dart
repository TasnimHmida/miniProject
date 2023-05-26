import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../models/development_course_model.dart';

abstract class RemoteDataSource {
  Future<List<DevelopmentCourseModel>> getAllDevelopmentCourses();
}

const BASE_URL = 'https://jsonplaceholder.typicode.com';

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<DevelopmentCourseModel>> getAllDevelopmentCourses() async {
    final response = await client.get(Uri.parse('${BASE_URL}/posts/'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<DevelopmentCourseModel> postModels = decodedJson
          .map<DevelopmentCourseModel>((jsonDevelopmentCourseModel) => DevelopmentCourseModel.fromJson(jsonDevelopmentCourseModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }
}
