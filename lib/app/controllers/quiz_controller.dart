import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/app/networking/words_api_service.dart';
import 'package:flutter_app/resources/widgets/quiz_page/quiz_font_widget.dart';
import 'package:flutter_app/resources/widgets/quiz_page/quiz_judge_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
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
    _wordsApiService.updateRecord(wordId, {
      'word_records': {'status': isCorrect ? 'correct' : 'incorrect'}
    });
  }

  Future<void> answer(bool isCorrect, int wordId) async {
    updateState(QuizJudge.state, data: isCorrect ? 'correct' : 'incorrect');
    updateState(QuizFont.state, data: isCorrect ? 'correct' : 'incorrect');

    playFeedbackAudio(isCorrect);

    await Future.delayed(Duration(milliseconds: 700));

    updateState(QuizJudge.state, data: 'hidden');
    updateState(QuizFont.state, data: 'hidden');
    updateRecord(isCorrect, wordId);
  }

  moveToNextWord(Word thisWord, int currentIndex, List<Word> words) async {
    if (currentIndex + 1 != words.length) {
      await speak(thisWord.name);
    } else {
      routeTo(
        '/result',
        data: words,
        queryParameters: {'courseId': queryParameters()['courseId']},
      );
    }
  }
}