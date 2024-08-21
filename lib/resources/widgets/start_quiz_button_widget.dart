import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class StartQuizButton extends StatelessWidget {
  final int courseId;
  const StartQuizButton({super.key, required this.courseId});

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
