import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class QuizController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  playFeedbackAudio(bool isCorrect) {
    playAudio(isCorrect ? 'audio/correct.mp3' : 'audio/incorrect.mp3');
  }
}
