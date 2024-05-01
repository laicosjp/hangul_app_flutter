import 'package:flutter_app/app/models/word.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Lesson Model.

class Lesson extends Model {
  final int id;
  final String title;
  final List<Word> words;
  final int courseId;

  Lesson({
    required this.id,
    required this.title,
    required this.words,
    required this.courseId,
  });

  factory Lesson.fromJson(data) {
    return Lesson(
      id: data['id'],
      title: data['title'],
      words: data['words'],
      courseId: data['courseId'],
    );
  }

  @override
  toJson() {
    return {};
  }
}
