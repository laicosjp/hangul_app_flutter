import 'package:nylo_framework/nylo_framework.dart';

/// WordRecord Model.

class WordRecord extends Model {
  final int id;
  final int wordId;
  final int userId;
  final String status;

  WordRecord({
    required this.id,
    required this.wordId,
    required this.userId,
    required this.status,
  });

  factory WordRecord.fromJson(data) {
    return WordRecord(
      id: data['id'],
      wordId: data['wordId'],
      userId: data['userId'],
      status: data['status'],
    );
  }

  @override
  toJson() {
    return {};
  }
}
