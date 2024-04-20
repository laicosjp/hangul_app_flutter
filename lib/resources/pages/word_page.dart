import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordPage extends NyStatefulWidget {
  static const path = '/word';

  WordPage({super.key}) : super(path, child: _WordPageState());
}

class _WordPageState extends NyState<WordPage> {
  var _lesson;
  List<Word> _words = [];
  int _currentIndex = 0;
  FlutterTts _tts = FlutterTts();
  String _answerProgress = 'hidden';

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
      setState(() {
        _answerProgress = 'correct';
      });
    } else {
      // 不正解の時の処理
      setState(() {
        _answerProgress = 'incorrect';
      });
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

  void _speak(word) {
    _tts.setLanguage('ko-KR');
    _tts.setSpeechRate(0.6);
    _tts.setVolume(1);
    _tts.speak(word);
  }

  Widget _buildChoiceButton(int choiceIndex) {
    return OutlinedButton(
      onPressed: () async {
        _checkAnswer(_words[_currentIndex].choices[choiceIndex]);
        await Future.delayed(Duration(milliseconds: 700));
        setState(() {
          _answerProgress = 'hidden';
        });
        _nextWord();
      },
      child: Text(_words[_currentIndex].choices[choiceIndex].translation),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 60),
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
            child: _answerProgress == 'correct'
                ? Text(
                    "Correct!",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.lightGreen.withOpacity(0.9)),
                  )
                : _answerProgress == 'incorrect'
                    ? Text(
                        "Incorrect...",
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue.withOpacity(0.9)),
                      )
                    : Container(), // 何も表示しない場合
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _words[_currentIndex].choices.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: _buildChoiceButton(index),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
