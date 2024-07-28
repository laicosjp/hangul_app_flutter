import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/app/networking/courses_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursePage extends NyStatefulWidget {
  static const path = '/course';

  CoursePage({super.key}) : super(path, child: _CoursePageState());
}

class _CoursePageState extends NyState<CoursePage> {
  late Course? _course;

  final CoursesApiService _apiService = CoursesApiService();

  @override
  init() async {
    _course =
        await _apiService.findById(int.parse(widget.queryParameters()['id']));
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_course?.title ?? '')),
      body: SafeArea(
        child: Container(
          child: Text(queryParameters()['id']),
        ),
      ),
    );
  }
}
