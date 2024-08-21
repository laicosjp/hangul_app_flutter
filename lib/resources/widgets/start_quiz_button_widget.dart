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
      return LearnThisCourse(courseId: courseId);
    }

    // 未学習が0：「retry incorrect words」
    if (unstudiedWordsCount == 0) {
      return RetryIncorrectWords(courseId: courseId);
    }

    // すべてcorrect: 「restart this course」
    if (wordsCount == correctWordsCount) {
      return RestartThisCourse(courseId: courseId);
    }

    // 着手中：「learn this course」「retry incorrect words」
    return LearntThisCourseAndRetryIncorrectWords(courseId: courseId);
  }
}

class LearnThisCourse extends StatelessWidget {
  const LearnThisCourse({
    super.key,
    required this.courseId,
  });

  final int courseId;

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
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Learn this course',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class RetryIncorrectWords extends StatelessWidget {
  const RetryIncorrectWords({
    super.key,
    required this.courseId,
  });

  final int courseId;

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
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Retry incorrect words',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class RestartThisCourse extends StatelessWidget {
  const RestartThisCourse({
    super.key,
    required this.courseId,
  });

  final int courseId;

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
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'Ret records and start to learn again',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class LearntThisCourseAndRetryIncorrectWords extends StatelessWidget {
  const LearntThisCourseAndRetryIncorrectWords({
    super.key,
    required this.courseId,
  });

  final int courseId;

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
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Text(
          'two buttons',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
