import 'package:nylo_framework/nylo_framework.dart';

/// Choice Model.

class Choice extends Model {
  final int id;
  final String name;
  final String answer;
  final bool isCorrect;

  Choice({
    required this.id,
    required this.name,
    required this.answer,
    required this.isCorrect,
  });

  factory Choice.fromJson(data) {
    return Choice(
      id: data['id'],
      name: data['name'],
      answer: data['answer'],
      isCorrect: data['isCorrect'],
    );
  }

  @override
  toJson() {
    return {};
  }
}
