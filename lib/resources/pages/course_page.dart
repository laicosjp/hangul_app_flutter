import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../services/courses_service.dart';

class CoursePage extends NyStatefulWidget {
  static const path = '/course';

  CoursePage({super.key}) : super(path, child: _CoursePageState());
}

class _CoursePageState extends NyState<CoursePage> {
  final CoursesService _coursesService = CoursesService();
  late Course _course;

  @override
  init() async {
    _course = await _coursesService.findOneByPath("data/${queryParameters()['slug']}.json");
  }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_course.title)),
      body: SafeAreaWidget(
        child: Container(),
      ),
    );
  }
}
