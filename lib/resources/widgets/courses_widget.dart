import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/course_card_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  static String state = "courses";

  @override
  createState() => _CoursesState();
}

class _CoursesState extends NyState<Courses> {
  _CoursesState() {
    stateName = Courses.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(Courses.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      CourseCard(
          title: "How Sweet",
          wordsCount: 100,
          thumbnailUrl:
              'https://t2.genius.com/unsafe/255x255/https%3A%2F%2Fimages.genius.com%2F2f2c553bf84b85ccc17daef3da1a3dbc.1000x1000x1.png'),
      CourseCard(
          title: "light",
          wordsCount: 150,
          thumbnailUrl:
              'https://t2.genius.com/unsafe/255x255/https%3A%2F%2Fimages.genius.com%2F859f4416f956c1a641b82143930c511e.729x729x1.jpg'),
    ]));
  }
}
