import 'package:flutter_app/app/models/word.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Course Model.

class Course extends Model {
  final int id;
  final String title;
  final String slug;
  final String thumbnailUrl;
  final int wordsCount;

  List<Word>? exampleWords;

  Course({
    required this.id,
    required this.title,
    required this.slug,
    required this.thumbnailUrl,
    required this.wordsCount,
    this.exampleWords,
  });

  factory Course.fromJson(data) {
    return Course(
      id: data['id'],
      title: data['title'],
      slug: data['slug'],
      thumbnailUrl: data['thumbnailUrl'],
      wordsCount: data['wordsCount'],
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
