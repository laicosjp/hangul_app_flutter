import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/app/networking/courses_api_service.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:gap/gap.dart';
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
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _course?.title ?? '',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: Color(0xff465AFF).withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.share_outlined,
                            color: Color(0xff465AFF),
                          ),
                        ),
                      ),
                    ),
                    Gap(8),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.green.shade50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.bookmark_border,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
