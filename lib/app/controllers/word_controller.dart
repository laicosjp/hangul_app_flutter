import 'package:flutter_tts/flutter_tts.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class WordController extends Controller {
  FlutterTts _tts = FlutterTts();

  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  void speak(_word) {
    _tts.setLanguage('ko-KR');
    _tts.setSpeechRate(0.6);
    _tts.setVolume(1);
    _word = _word.replaceAll(RegExp(r'\(.*?\)'), ''); // カッコの中身は読み上げない
    _tts.speak(_word);
  }
}
