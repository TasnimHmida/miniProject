import '../../domain/entities/development_courses.dart';

class DevelopmentCourseModel extends DevelopmentCourse {
  const DevelopmentCourseModel(
      {super.id, required super.title, required super.body});

  factory DevelopmentCourseModel.fromJson(Map<String, dynamic> json) {
    return DevelopmentCourseModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}
