import 'package:nylo_framework/nylo_framework.dart';

/// Word Model.

class Word extends Model {
  final int id;
  final int courseId;
  final String origin;
  final String translation;

  Word({
    required this.id,
    required this.origin,
    required this.courseId,
    required this.translation,
  });

  factory Word.fromJson(data) {
    return Word(
      id: data['id'],
      origin: data['origin'],
      courseId: data['course_id'],
      translation: data['translation'],
    );
  }

  // @override
  // toJson() {
  //   return {};
  // }
}
