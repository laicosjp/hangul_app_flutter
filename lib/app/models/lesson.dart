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

  // @override
  // toJson() {
  //   return {};
  // }

  factory Lesson.fromCsv(List<String> csvRow) {
    return Lesson(
      id: int.parse(csvRow[0]),
      title: csvRow[2],
      courseId: int.parse(csvRow[1]),
      words: [],
    );
  }

  Future<List<int>> learnedWordIds() async {
    List<int> _correctWordIds = await NyStorage.readCollection("correctWordIds");

    return this.words.where((word) => _correctWordIds.contains(word.id)).map((e) => e.id).toList();
  }
}
