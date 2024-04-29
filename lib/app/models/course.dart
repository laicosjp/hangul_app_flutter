import 'package:nylo_framework/nylo_framework.dart';

/// Course Model.

class Course extends Model {
  final int id;
  final String title;
  final bool isPublished;

  Course({
    required this.id,
    required this.title,
    required this.isPublished,
  });

  factory Course.fromJson(data) {
    return Course(
      id: data['id'],
      title: data['title'],
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
      title: csvRow[1],
      isPublished: csvRow[2].toLowerCase() == "true",
    );
  }
}
