import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:nylo_framework/nylo_framework.dart';

class QuizFont extends StatefulWidget {
  final Word thisWord;

  const QuizFont({super.key, required this.thisWord});

  static String state = "quiz_font";

  @override
  createState() => _QuizFontState();
}

class _QuizFontState extends NyState<QuizFont> {
  String answerProgress = 'hidden'; // hidden, correct, incorrect

  _QuizFontState() {
    stateName = QuizFont.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(QuizFont.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    final Word thisWord = widget.thisWord;

    return Expanded(
      flex: 7,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: Text(
                thisWord.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: answerProgress == 'correct'
                  ? Icon(
                      CupertinoIcons.circle,
                      color: Colors.lightGreen.withOpacity(0.4),
                      size: 300,
                    )
                  : answerProgress == 'incorrect'
                      ? Icon(
                          CupertinoIcons.clear,
                          color: Colors.blue.withOpacity(0.4),
                          size: 300,
                        )
                      : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
