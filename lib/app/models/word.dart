import 'package:flutter_app/app/models/choice.dart';
import 'package:nylo_framework/nylo_framework.dart';

/// Word Model.

class Word extends Model {
  final int id;
  final String name;
  final String answer;

  List<Choice>? choices;

  Word({
    required this.id,
    required this.name,
    required this.answer,
    this.choices = const [],
  });

  factory Word.fromJson(data) {
    return Word(
      id: data['id'],
      name: data['name'],
      answer: data['answer'],
      choices: data['choices']
          .map<Choice>((choice) => Choice.fromJson(choice))
          .toList(),
    );
  }

  // @override
  // toJson() {
  //   return {};
  // }
}
