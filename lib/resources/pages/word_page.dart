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
  final _wordsService = WordsService();
  final PER_WORD = 10;
  List<Word> _exercisedWords = [];

  @override
  init() async {
    super.init();
    _lessonId = int.parse(widget.queryParameters()['lessonId']);
    _words = await _wordsService.findAll(lessonId: _lessonId, onlyNew: true);
    widget.controller.speak(_words[_currentIndex].text);
  }

  Future<void> onAnswered(int choiceIndex) async {
    Word currentWord = _words[_currentIndex];
    Word chosenWord = currentWord.choices[choiceIndex];
    bool isCorrect = currentWord == chosenWord;

    updateAnswerProgress(isCorrect);
    widget.controller.playFeedbackAudio(isCorrect);
    recordAnswer(currentWord, chosenWord);

    await Future.delayed(Duration(milliseconds: 700));
    moveToNextWord();
  }

  void updateAnswerProgress(bool isCorrect) {
    setState(() {
      _answerProgress = isCorrect ? 'correct' : 'incorrect';
    });
  }

  void recordAnswer(Word chosenWord, Word currentWord) {
    widget.controller.recordScore(chosenWord, currentWord);
    _exercisedWords.add(currentWord);
  }

  void moveToNextWord() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _words.length;
      _answerProgress = 'hidden';
    });

    print("=============");
    print(_currentIndex);
    print(PER_WORD);
    print("=============");

    if (_currentIndex == PER_WORD) {
      routeTo('/result', data: _exercisedWords);
    } else {
      widget.controller.speak(_words[_currentIndex].text);
    }
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
