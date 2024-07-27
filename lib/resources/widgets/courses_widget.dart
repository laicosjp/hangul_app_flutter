import 'package:flutter/material.dart';
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
    return Container();
  }
}
