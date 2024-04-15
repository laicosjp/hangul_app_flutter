import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursesPage extends NyStatefulWidget {
  static const path = '/courses';

  CoursesPage({super.key}) : super(path, child: _CoursesPageState());
}

class _CoursesPageState extends NyState<CoursesPage> {
  final List<Map<String, dynamic>> courses = [
    {"course_title": 'ハングル検定5級', "course_id": "5"},
    {"course_title": 'ハングル検定4級', "course_id": "4"}
  ];

  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("コース")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(courses[index]['course_title']),
              onTap: () {
                routeTo('/course', queryParameters: {
                  'course_id': courses[index]['course_id']
                });
              },
            );
          },
        ),
      ),
    );
  }
}
