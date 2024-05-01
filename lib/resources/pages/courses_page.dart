import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/resources/services/csv_loader_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursesPage extends NyStatefulWidget {
  static const path = '/courses';

  CoursesPage({super.key}) : super(path, child: _CoursesPageState());
}

class _CoursesPageState extends NyState<CoursesPage> {
  List<Course> courses = [];

  @override
  init() async {
    courses = await CsvLoaderService().getAllCourses();
    courses = courses.where((course) => course.isPublished).toList();
  }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("コース"), automaticallyImplyLeading: false),
      body: SafeArea(
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(courses[index].title),
              onTap: () {
                routeTo('/course', queryParameters: {'course_id': courses[index].id.toString()});
              },
            );
          },
        ),
      ),
    );
  }
}
