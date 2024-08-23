import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/quiz_controller.dart';
import 'package:flutter_app/app/models/choice.dart';
import 'package:flutter_app/app/networking/courses_api_service.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/quiz_page/quiz_judge_widget.dart';
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

  final _controller = QuizController();
  final CoursesApiService _coursesApiService = CoursesApiService();

  @override
  init() async {
    super.init();
    _words = await _coursesApiService.findWithWords(
            int.parse(widget.queryParameters()['courseId']),
            status: queryParameters()['status']) ??
        [];

    if (_words.isEmpty) {
      routeTo('/course',
          queryParameters: {'id': widget.queryParameters()['courseId']});
      showDialog(
        context: context!,
        builder: (context) => AlertDialog(
          title: Text('No words found'),
        ),
      );
      return;
    }

    await _controller.speak(_words[_currentIndex].name);
  }

  Future<void> onAnswered(bool isCorrect) async {
    judgeAnswer(isCorrect);
    _controller.answer(isCorrect);
    _controller.playFeedbackAudio(isCorrect);
    _controller.updateRecord(isCorrect, _words[_currentIndex].id);

    await Future.delayed(Duration(milliseconds: 700));
    await moveToNextWord();
  }

  void judgeAnswer(bool isCorrect) {
    setState(() {
      _answerProgress = isCorrect ? "correct" : 'incorrect';
    });
  }
  
  Future<void> moveToNextWord() async {
    if (_currentIndex + 1 != _words.length) {
      setState(() {
        _currentIndex += 1;
        _answerProgress = 'hidden';
      });
      await _controller.speak(_words[_currentIndex].name);
    } else {
      routeTo('/result',
          data: _words,
          queryParameters: {'courseId': widget.queryParameters()['courseId']});
    }
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
    if (_words.isEmpty) {
      return Container(); // 空のコンテナを返す
    }

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
          QuizJudge(),
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
