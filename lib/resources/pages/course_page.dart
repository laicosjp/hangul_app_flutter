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
                child: Container(
                  child: Column(
                    children: [
                      Row(
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
                                backgroundColor:
                                    Color(0xff465AFF).withOpacity(0.1),
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
                                  Icons.public_outlined,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        Icon(
                          Icons.menu_book,
                          color: Colors.black54,
                          size: 16,
                        ),
                        Gap(4),
                        Text(
                          "${_course?.wordsCount} words",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ])
                    ],
                  ),
                ),
              ),
              Gap(8),
              Divider(),
              Gap(8),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Words you'll learn",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(8),
                    Wrap(
                      spacing: 2,
                      runSpacing: 2,
                      children: (_course?.words ?? []).take(15).map((word) {
                        return Chip(
                          label: Text(word.name),
                          backgroundColor: Color(0xffEBEBEb),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                          ),
                        );
                      }).toList(),
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
