import 'package:dio/dio.dart';
import 'package:graduation/API/models/Lesson_model.dart';

Future<List<LessonModel>> lessonFetchHandler() async {
  var response = await Dio().get("http://localhost:8080/ApprovedPost",
      options: Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      ));
  var body = response.data;

  List<LessonModel> lessons = [];
  for (var lesson in body) {
    lessons.add(LessonModel.fromJson(lesson));
  }
  return lessons;
}
