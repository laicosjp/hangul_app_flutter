import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursesPage extends NyStatefulWidget {
  static const path = '/courses';

  CoursesPage({super.key}) : super(path, child: _CoursesPageState());
}

class _CoursesPageState extends NyState<CoursesPage> {
  final List<String> courses = ['ハングル検定5級'];

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
              title: Text(courses[index]),
              onTap: () {
                routeTo('/course');
              },
            );
          },
        ),
      ),
    );
  }
}
