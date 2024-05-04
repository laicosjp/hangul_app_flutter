import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/word_controller.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/services/words_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordPage extends NyStatefulWidget<WordController> {
  static const path = '/word';

  WordPage({super.key}) : super(path, child: _WordPageState());
}

class _WordPageState extends NyState<WordPage> {
  int _lessonId = 0;
  List<Word> _words = [];
  int _currentIndex = 0;
  String _answerProgress = 'hidden';
  final _player = AudioPlayer();
  final _wordsService = WordsService();
  final PER_WORD = 9;
  List<Word> _exercisedWords = [];

  @override
  init() async {
    super.init();
    _player.audioCache = AudioCache(prefix: 'public/assets/');
    _lessonId = int.parse(widget.queryParameters()['lessonId']);
    _words = await _wordsService.findAll(lessonId: _lessonId, onlyNew: true);
    widget.controller.speak(_words[_currentIndex].text);
  }

  void _checkAnswer(response) {
    if (_words[_currentIndex] == response) {
      // 正解の時の処理
      setState(() {
        _answerProgress = 'correct';
        _player.play(AssetSource('audio/correct.mp3'));
      });
    } else {
      // 不正解の時の処理
      setState(() {
        _answerProgress = 'incorrect';
        _player.play(AssetSource('audio/incorrect.mp3'));
      });
    }
  }

  void _nextWord() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _words.length;
    });

    if (_currentIndex == PER_WORD) {
      routeTo('/result', data: _exercisedWords);
    } else {
      widget.controller.speak(_words[_currentIndex].text);
    }
  }

  Future<void> _recordAnswer(response) async {
    await NyStorage.deleteFromCollectionWhere((wordId) => wordId == _words[_currentIndex].id, key: "correctWordIds");

    if (_words[_currentIndex] == response) {
      await NyStorage.addToCollection("correctWordIds", item: _words[_currentIndex].id);
    }
  }

  Future<void> onAnswered(int choiceIndex) async {
    _checkAnswer(_words[_currentIndex].choices[choiceIndex]);
    await _recordAnswer(_words[_currentIndex].choices[choiceIndex]);
    _exercisedWords.add(_words[_currentIndex]);
    await Future.delayed(Duration(milliseconds: 700));
    setState(() {
      _answerProgress = 'hidden';
    });
    _player.stop(); // この処理がないと、連続で正解（or不正解）の時に音声が再生されない
    _nextWord();
  }

  Widget _buildChoiceButton(int choiceIndex) {
    return OutlinedButton(
      onPressed: () async {
        await onAnswered(choiceIndex);
      },
      child: Text(_words[_currentIndex].choices[choiceIndex].translation),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 58),
        side: BorderSide(color: ThemeColor.get(context).primaryAccent),
        foregroundColor: ThemeColor.get(context).buttonPrimaryContent,
      ),
    );
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("レッスンの名前")),
      body: Container(
        child: Column(children: [
          Expanded(
            flex: 7,
            child: Center(
                child: Stack(
              children: [
                Center(child: Text(_words[_currentIndex].text, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                Center(
                  child: _answerProgress == 'correct'
                      ? Icon(
                          CupertinoIcons.circle,
                          color: Colors.lightGreen.withOpacity(0.4),
                          size: 300,
                        )
                      : _answerProgress == 'incorrect'
                          ? Icon(
                              CupertinoIcons.clear,
                              color: Colors.blue.withOpacity(0.4),
                              size: 300,
                            )
                          : Container(),
                ),
              ],
            )),
          ),
          Expanded(
            flex: 1,
            child: _answerProgress == 'correct'
                ? Text(
                    "Correct!",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.lightGreen.withOpacity(0.7)),
                  )
                : _answerProgress == 'incorrect'
                    ? Text(
                        "Incorrect...",
                        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue.withOpacity(0.7)),
                      )
                    : Container(),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _words[_currentIndex].choices.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
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
