import 'package:nylo_framework/nylo_framework.dart';

/// Word Model.

class Word extends Model {
  final int id;
  final String name;
  final String answer;

  Word({
    required this.id,
    required this.name,
    required this.answer,
  });

  factory Word.fromJson(data) {
    return Word(
      id: data['id'],
      name: data['name'],
      answer: data['answer'],
    );
  }

  // @override
  // toJson() {
  //   return {};
  // }
}
