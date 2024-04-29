import 'package:nylo_framework/nylo_framework.dart';

/// Word Model.

class Word extends Model {
  final int id;
  final int courseId;
  final String text;
  final String translation;
  final List<Word> choices;

  Word({
    required this.id,
    required this.text,
    required this.courseId,
    required this.translation,
    required this.choices,
  });

  factory Word.fromJson(data) {
    return Word(
      id: data['id'],
      text: data['text'],
      courseId: data['courseId'],
      translation: data['translation'],
      choices: data['choices'],
    );
  }

  // @override
  // toJson() {
  //   return {};
  // }

  factory Word.fromCsv(List<String> csvRow) {
    return Word(
      id: int.parse(csvRow[0]),
      courseId: int.parse(csvRow[1]),
      text: csvRow[2],
      translation: csvRow[3],
      choices: [],
    );
  }
}
