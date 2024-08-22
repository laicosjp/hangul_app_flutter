import 'package:flutter_app/app/networking/words_api_service.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class QuizController extends Controller {
  final _wordsApiService = WordsApiService();

  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  playFeedbackAudio(bool isCorrect) {
    playAudio(isCorrect ? 'audio/correct.mp3' : 'audio/incorrect.mp3');
  }

  updateRecord(bool isCorrect, int wordId) {
    _wordsApiService.updateRecord(wordId, {'word_records': {'status': isCorrect ? 'correct' : 'incorrect'}});
  }
}
