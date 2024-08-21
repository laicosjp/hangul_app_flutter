import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class StartQuizButton extends StatelessWidget {
  final int courseId;
  final int wordsCount;
  final int correctWordsCount;
  final int incorrectWordsCount;
  final int unstudiedWordsCount;

  const StartQuizButton({
    super.key,
    required this.courseId,
    required this.wordsCount,
    required this.correctWordsCount,
    required this.incorrectWordsCount,
    required this.unstudiedWordsCount,
  });

  @override
  Widget build(BuildContext context) {
    // 着手前：「learn this course」
    if (wordsCount == unstudiedWordsCount) {
      return QuizActionButton(
        courseId: courseId,
        buttonText: 'Learn this course',
        buttonColor: Colors.orange,
      );
    }

    // 未学習が0：「retry incorrect words」
    if (unstudiedWordsCount == 0) {
      return QuizActionButton(
        courseId: courseId,
        buttonText: 'Retry incorrect words',
        buttonColor: Colors.blue,
      );
    }

    // すべてcorrect: 「restart this course」
    if (wordsCount == correctWordsCount) {
      return QuizActionButton(
        courseId: courseId,
        buttonText: 'Ret records and start to learn again',
        buttonColor: Colors.grey,
      );
    }

    // 着手中：「learn this course」「retry incorrect words」
    return QuizActionButton(
      courseId: courseId,
      buttonText: 'two buttons',
      buttonColor: Colors.blue,
    );
  }
}

class QuizActionButton extends StatelessWidget {
  final int courseId;
  final String buttonText;
  final Color buttonColor;

  const QuizActionButton({
    super.key,
    required this.courseId,
    required this.buttonText,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          routeTo(
            '/quiz',
            queryParameters: {
              'courseId': courseId.toString(),
            },
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
