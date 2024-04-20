import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
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
    _speak(_words[_currentIndex].text);
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
      _speak(_words[_currentIndex].text);
    }
  }

  void _onPressedChoice(response) {
    _checkAnswer(response);
    _nextWord();
  }

  void _speak(word) {
    _tts.setLanguage('ko-KR');
    _tts.setSpeechRate(0.6);
    _tts.setVolume(1);
    _tts.speak(word);
  }

  Widget _buildChoiceButton(int choiceIndex) {
    return OutlinedButton(
      onPressed: () {
        _onPressedChoice(_words[_currentIndex].choices[choiceIndex]);
      },
      child: Text(_words[_currentIndex].choices[choiceIndex].translation),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 70),
        side: BorderSide(color: ThemeColor.get(context).primaryContent),
      ),
    );
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(queryParameters()['lesson_name'])),
      body: Container(
        child: Column(children: [
          Expanded(
            flex: 7,
            child: Center(
                child: Stack(
              children: [
                Center(child: Text(_words[_currentIndex].text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                Center(
                    child: Icon(
                  CupertinoIcons.circle,
                  color: Colors.lightGreen.withOpacity(0.5),
                  size: 300,
                )),
              ],
            )),
          ),
          Expanded(
              flex: 1,
              child: Text(
                "Correct!",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.lightGreen.withOpacity(0.9)),
              )),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _words[_currentIndex].choices.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      _buildChoiceButton(index),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
