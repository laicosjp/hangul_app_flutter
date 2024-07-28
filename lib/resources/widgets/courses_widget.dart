import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/resources/widgets/course_card_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursesWidget extends StatefulWidget {
  List<Course> courses = [];
  CoursesWidget({super.key, this.courses = const []});

  static String state = "courses";

  @override
  createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends NyState<CoursesWidget> {
  _CoursesWidgetState() {
    stateName = CoursesWidget.state;
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
        child: Column(
            children: widget.courses
                .map((course) => CourseCard(
                      id: course.id,
                      title: course.title,
                      wordsCount: 100,
                      thumbnailUrl: course.thumbnailUrl,
                    ))
                .toList()));
  }
}
