import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/quiz_controller.dart';
import 'package:flutter_app/app/models/choice.dart';
import 'package:flutter_app/app/networking/courses_api_service.dart';
import 'package:flutter_app/app/networking/words_api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter/cupertino.dart';

class QuizPage extends NyStatefulWidget {
  static const path = '/quiz';

  QuizPage({super.key}) : super(path, child: _QuizPageState());
}

class _QuizPageState extends NyState<QuizPage> {
  late List<Word> _words = [];
  int _currentIndex = 0;
  String _answerProgress = 'hidden'; // or 'correct' and 'incorrect'
  FlutterTts _flutterTts = FlutterTts();

  final _controller = QuizController();
  final CoursesApiService _coursesApiService = CoursesApiService();
  final WordsApiService _wordsApiService = WordsApiService();

  @override
  init() async {
    super.init();
    _words = await _coursesApiService
            .findWithWords(int.parse(widget.queryParameters()['courseId']), status: queryParameters()['status']) ??
        [];

    await speak(_words[_currentIndex].name);
  }

  Future<void> onAnswered(bool isCorrect) async {
    judgeAnswer(isCorrect);
    playFeedbackAudio(isCorrect);
    updateRecord(isCorrect);

    await Future.delayed(Duration(milliseconds: 700));
    await moveToNextWord();
  }

  void judgeAnswer(bool isCorrect) {
    setState(() {
      _answerProgress = isCorrect ? "correct" : 'incorrect';
    });
  }

  void playFeedbackAudio(bool isCorrect) {
    _controller.playFeedbackAudio(isCorrect);
  }

  Future<void> moveToNextWord() async {
    if (_currentIndex + 1 != _words.length) {
      setState(() {
        _currentIndex += 1;
        _answerProgress = 'hidden';
      });
      await speak(_words[_currentIndex].name);
    } else {
      routeTo('/result', data: _words, queryParameters: { 'courseId': widget.queryParameters()['courseId']});
    }
  }

  void updateRecord(bool isCorrect) {
    final data = {
      'word_records': {'status': isCorrect ? 'correct' : 'incorrect'}
    };
    _wordsApiService.updateRecord(_words[_currentIndex].id, data);
  }

  Future<void> speak(String text) async {
    await _flutterTts.setLanguage("ko-KR");
    await _flutterTts.speak(text);
  }

  Widget _buildChoiceButton(Choice _choice) {
    return OutlinedButton(
      onPressed: () async {
        await onAnswered(_choice.isCorrect);
      },
      child: Text(_choice.answer),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 58),
        side: BorderSide(color: ThemeColor.get(context).primaryAccent),
        foregroundColor: ThemeColor.get(context).buttonPrimaryContent,
      ),
    );
  }

  @override
  Widget view(BuildContext context) {
    final Word _thisWord = _words[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text("Lesson")),
      body: Container(
        child: Column(children: [
          Expanded(
            flex: 7,
            child: Center(
                child: Stack(
              children: [
                Center(
                    child: Text(_thisWord.name,
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
                  child: _buildChoiceButton(
                    _thisWord.choices![index],
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
