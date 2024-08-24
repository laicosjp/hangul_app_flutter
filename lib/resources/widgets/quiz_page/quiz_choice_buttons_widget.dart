import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/quiz_controller.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_app/app/models/word.dart';

class QuizChoiceButtons extends StatefulWidget {
  final Word thisWord;
  final List<Word> words;

  const QuizChoiceButtons({super.key, required this.thisWord, required this.words});

  static String state = "quiz_choice_buttons";

  @override
  createState() => _QuizChoiceButtonsState();
}

class _QuizChoiceButtonsState extends NyState<QuizChoiceButtons> {
  final _controller = QuizController();

  _QuizChoiceButtonsState() {
    stateName = QuizChoiceButtons.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(QuizChoiceButtons.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    final Word thisWord = widget.thisWord;

    return Expanded(
      flex: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: OutlinedButton(
              onPressed: () async {
                await _controller.answer(thisWord.choices![index].isCorrect, thisWord.id);
                await _controller.moveToNextWord(thisWord, index, widget.words);
              },
              child: Text(thisWord.choices![index].answer),
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 58),
                side: BorderSide(color: ThemeColor.get(context).primaryAccent),
                foregroundColor: ThemeColor.get(context).buttonPrimaryContent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}