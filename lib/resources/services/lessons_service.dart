import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/resources/services/csv_loader_service.dart';
import 'package:flutter_app/resources/services/words_service.dart';

class LessonsService extends CsvLoaderService {
  final _wordsService = WordsService();

  Future<List<Lesson>> findAll({int? courseId}) async {
    final _csvList = await convertCsv(model: "lessons");
    List<Lesson> _lessons = _csvList.map((csvRow) => Lesson.fromCsv(csvRow)).toList();

    if (courseId != null) {
      _lessons = _lessons.where((lesson) => lesson.courseId == courseId).toList();
    }

    // assign words
    for (Lesson lesson in _lessons) {
      List<Word> words = await _wordsService.findAll(lessonId: lesson.id);
      lesson.words.addAll(words);
    }

    return _lessons;
  }

  Future<Lesson> findOne(int id) async {
    final _csvList = await convertCsv(model: "lessons");
    final _lesson = _csvList.map((csvRow) => Lesson.fromCsv(csvRow)).toList().firstWhere((lesson) => lesson.id == id);

    return _lesson;
  }
}
