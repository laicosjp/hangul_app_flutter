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
    return QuizActionButton(
      courseId: courseId,
      buttonText: 'Learn this course',
      buttonColor: Colors.orange,
      onPressed: () {
        routeTo(
          '/quiz',
          queryParameters: {
            'courseId': courseId.toString(),
          },
        );
      },
    );
  }
}

class QuizActionButton extends StatelessWidget {
  final int courseId;
  final String buttonText;
  final Color buttonColor;
  final VoidCallback onPressed;

  const QuizActionButton({
    super.key,
    required this.courseId,
    required this.buttonText,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
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
