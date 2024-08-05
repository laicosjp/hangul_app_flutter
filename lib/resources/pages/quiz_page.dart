import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter/cupertino.dart';

class QuizPage extends NyStatefulWidget {
  static const path = '/quiz';

  QuizPage({super.key}) : super(path, child: _QuizPageState());
}

class _QuizPageState extends NyState<QuizPage> {
  List<Word> _words = [];
  int _currentIndex = 0;
  String _answerProgress = 'hidden';
  final PER_WORD = 10;

  @override
  init() async {
    super.init();
    _words = widget.data();

    // if (_words.isEmpty) {
    //   routeTo(CompletePage.path,
    //       queryParameters: {'lessonId': _lessonId.toString()});
    //   return;
    // }
    //
    // widget.controller.speak(_words[_currentIndex].text);
  }

  Future<void> onAnswered(int choiceIndex) async {
    // Word currentWord = _words[_currentIndex];
    // Word chosenWord = currentWord.choices[choiceIndex];
    // bool isCorrect = currentWord == chosenWord;

    // widget.controller.playFeedbackAudio(isCorrect);

    await Future.delayed(Duration(milliseconds: 700));
    moveToNextWord();
  }

  void updateAnswerProgress(bool isCorrect) {
    setState(() {
      _answerProgress = isCorrect ? 'correct' : 'incorrect';
    });
  }

  void moveToNextWord() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _words.length;
      _answerProgress = 'hidden';
    });

    if (_currentIndex == PER_WORD ||
        (_words.length < PER_WORD && _currentIndex == 0)) {
      // routeTo('/result', data: _exercisedWords);
    } else {
      // widget.controller.speak(_words[_currentIndex].name);
    }
  }

  Widget _buildChoiceButton(int choiceIndex) {
    return OutlinedButton(
      onPressed: () async {
        await onAnswered(choiceIndex);
      },
      child: Text(_words[_currentIndex].choices![choiceIndex].answer),
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
      appBar: AppBar(title: Text("レッスン")),
      body: Container(
        child: Column(children: [
          Expanded(
            flex: 7,
            child: Center(
                child: Stack(
              children: [
                Center(
                    child: Text(_words[_currentIndex].name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))),
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
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen.withOpacity(0.7)),
                  )
                : _answerProgress == 'incorrect'
                    ? Text(
                        "Incorrect...",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.withOpacity(0.7)),
                      )
                    : Container(),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
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
