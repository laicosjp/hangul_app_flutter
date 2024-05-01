import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/resources/services/csv_loader_service.dart';

class LessonsService extends CsvLoaderService {
  Future<List<Lesson>> findAll({int? courseId}) async {
    final _csvList = await convertCsv(model: "lessons");
    List<Lesson> _lessons = _csvList.map((csvRow) => Lesson.fromCsv(csvRow)).toList();

    if (courseId != null) {
      _lessons = _lessons.where((lesson) => lesson.courseId == courseId).toList();
    }

    return _lessons;
  }

  Future<Lesson> findOne(int id) async {
    final _csvList = await convertCsv(model: "lessons");
    final _lesson = _csvList.map((csvRow) => Lesson.fromCsv(csvRow)).toList().firstWhere((lesson) => lesson.id == id);

    return _lesson;
  }
}
