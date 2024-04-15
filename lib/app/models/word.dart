import 'package:nylo_framework/nylo_framework.dart';

/// Word Model.

class Word extends Model {
  String? id;
  String? content;
  String? translation;

  Word();

  Word.fromJson(dynamic data) {
    id = data['id'];
    content = data['content'];
    translation = data['translation'];
  }

  @override
  toJson() => {"id": id, "content": content, "translation": translation};
}
