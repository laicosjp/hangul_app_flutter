import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordPage extends NyStatefulWidget {
  static const path = '/word';

  WordPage({super.key}) : super(path, child: _WordPageState());
}

class _WordPageState extends NyState<WordPage> {
  var _lesson;
  var _words = [];
  int _currentIndex = 0;
  FlutterTts _tts = FlutterTts();

  @override
  init() async {
    super.init();
    _lesson = widget.data();
    _words = _lesson.words;

    _tts.setLanguage('ko-KR');
    _tts.setSpeechRate(0.8);
    _tts.setVolume(1);
    _tts.speak(_words[_currentIndex].text);
  }

  void _checkAnswer(response) {
    if (_words[_currentIndex] == response) {
      // 正解の時の処理
    } else {
      // 不正解の時の処理
    }
  }

  void _nextWord() {
    if (_currentIndex == _words.length - 1) {
      routeTo('/result');
    } else {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _words.length;
      });
    }
  }

  void onPressedChoice(response) {
    _checkAnswer(response);
    _nextWord();
  }

  Widget _buildChoiceButton(int choiceIndex) {
    return OutlinedButton(
      onPressed: () {
        onPressedChoice(_words[_currentIndex].choices[choiceIndex]);
      },
      child: Text(_words[_currentIndex].choices[choiceIndex].translation),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        side: BorderSide(color: Colors.orange),
      ),
    );
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(queryParameters()['lesson_name'])),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  _words[_currentIndex].text.toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: List.generate(
                  _words[_currentIndex].choices.length,
                  (index) => Column(
                    children: [
                      _buildChoiceButton(index),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
