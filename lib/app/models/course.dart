import 'package:flutter_app/app/models/word.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Course Model.

class Course extends Model {
  final int id;
  final String title;
  final String slug;
  final String thumbnailUrl;
  final int wordsCount;
  final int? correctedWordsCount;
  final int? incorrectedWordsCount;
  final int? unstudiedWordsCount;

  List<Word>? exampleWords;

  Course({
    required this.id,
    required this.title,
    required this.slug,
    required this.thumbnailUrl,
    required this.wordsCount,
    this.correctedWordsCount,
    this.incorrectedWordsCount,
    this.unstudiedWordsCount,
    this.exampleWords,
  });

  factory Course.fromJson(data) {
    return Course(
      id: data['id'],
      title: data['title'],
      slug: data['slug'],
      thumbnailUrl: data['thumbnailUrl'],
      wordsCount: data['wordsCount'],
      correctedWordsCount: data['correctedWordsCount'] ?? 0,
      incorrectedWordsCount: data['incorrectedWordsCount'] ?? 0,
      unstudiedWordsCount: data['unstudiedWordsCount'] ?? 0,
      exampleWords: data['exampleWords'] != null
          ? List<Word>.from(data['exampleWords'].map((word) => Word.fromJson(word)))
          : [],
    );
  }

  // @override
  // toJson() {
  //   return {};
  // }
}
