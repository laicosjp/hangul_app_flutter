import 'package:nylo_framework/nylo_framework.dart';

/// Course Model.

class Course extends Model {
  final int id;
  final String text;
  final bool isPublished;

  Course({
    required this.id,
    required this.text,
    required this.isPublished,
  });

  factory Course.fromJson(data) {
    return Course(
      id: data['id'],
      text: data['text'],
      isPublished: data['isPublished'],
    );
  }

  // @override
  // toJson() {
  //   return {};
  // }

  factory Course.fromCsv(csvRow) {
    return Course(
      id: int.parse(csvRow[0]),
      text: csvRow[1],
      isPublished: csvRow[2].toLowerCase() == "true",
    );
  }
}
