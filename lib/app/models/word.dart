import 'package:nylo_framework/nylo_framework.dart';

/// Word Model.

class Word extends Model {
  final int id;
  final String text;
  final String translation;

  Word({
    required this.id,
    required this.text,
    required this.translation,
  });

  factory Word.fromJson(data) {
    return Word(
      id: data['id'],
      text: data['text'],
      translation: data['translation'],
    );
  }

  // @override
  // toJson() {
  //   return {};
  // }

  factory Word.fromCsv(List<String> csvRow) {
    return Word(
      id: int.parse(csvRow[0]),
      text: csvRow[1],
      translation: csvRow[2],
    );
  }
}
