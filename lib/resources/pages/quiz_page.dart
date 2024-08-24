import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/quiz_controller.dart';
import 'package:flutter_app/app/networking/courses_api_service.dart';
import 'package:flutter_app/resources/widgets/quiz_page/quiz_choice_buttons_widget.dart';
import 'package:flutter_app/resources/widgets/quiz_page/quiz_font_widget.dart';
import 'package:flutter_app/resources/widgets/quiz_page/quiz_judge_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_app/app/models/word.dart';

class QuizPage extends NyStatefulWidget {
  static const path = '/quiz';

  QuizPage({super.key}) : super(path, child: _QuizPageState());
}

class _QuizPageState extends NyState<QuizPage> {
  late List<Word> _words = [];
  Word? _thisWord;

  final _controller = QuizController();
  final CoursesApiService _coursesApiService = CoursesApiService();

  @override
  stateUpdated(dynamic data) {
    _thisWord = data;
  }

  @override
  init() async {
    super.init();
    _words = await _coursesApiService.findWithWords(
            int.parse(widget.queryParameters()['courseId']),
            status: queryParameters()['status']) ??
        [];
    _thisWord = _words[0];

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

    await _controller.speak(_thisWord!.name);
  }

  @override
  Widget view(BuildContext context) {
    if (_thisWord == null) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(title: Text("Lesson")),
      body: Container(
        child: Column(children: [
          QuizFont(thisWord: _thisWord!),
          QuizJudge(),
          QuizChoiceButtons(thisWord: _thisWord!, words: _words),
        ]),
      ),
    );
  }
}
