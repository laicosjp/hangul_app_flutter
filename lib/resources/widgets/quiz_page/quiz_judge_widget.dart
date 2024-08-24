import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class QuizJudge extends StatefulWidget {
  const QuizJudge({super.key});

  static String state = "quiz_judge";

  @override
  createState() => _QuizJudgeState();
}

class _QuizJudgeState extends NyState<QuizJudge> {
  String answerProgress = 'hidden'; // hidden, correct, incorrect

  _QuizJudgeState() {
    stateName = QuizJudge.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(QuizJudge.state, data: "example payload");
    answerProgress = data;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: answerProgress == 'correct'
          ? Text(
              "Correct!",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen.withOpacity(0.7)),
            )
          : answerProgress == 'incorrect'
              ? Text(
                  "Incorrect...",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.withOpacity(0.7)),
                )
              : Container(),
    );
  }
}
