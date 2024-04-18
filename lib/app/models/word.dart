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

  // Word.fromJson(data) {

  // }

  // @override
  // toJson() {
  //   return {};
  // }

  factory Word.fromCsv(List<dynamic> csvRow) {
    return Word(
      id: int.parse(csvRow[0].toString()),
      text: csvRow[1].toString(),
      translation: csvRow[2].toString(),
    );
  }
}
