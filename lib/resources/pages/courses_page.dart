import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/app/networking/courses_api_service.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursesPage extends NyStatefulWidget {
  static const path = '/courses';

  CoursesPage({super.key}) : super(path, child: _CoursesPageState());
}

class _CoursesPageState extends NyState<CoursesPage> {
  final _coursesApiService = CoursesApiService();

  late List<Course> _courses;

  @override
  init() async {
    _courses = await _coursesApiService.findAll() ?? [];
  }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("コース選択"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                routeTo('/policy');
              },
              icon: Icon(Icons.info_outline))
        ],
      ),
      body: SafeAreaWidget(
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () {
                  routeTo('/course', queryParameters: {'course_id': _courses[position].id.toString()});
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: AssetImage("public/assets/images/seoul${_courses[position].id}.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        // width: width - (width / 3) - 16,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(_courses[position].title, style: TextStyle(fontWeight: FontWeight.w600)),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    // Icon(Icons.timelapse, size: 16, color: Colors.orange),
                                    // SizedBox(width: 2),
                                    Text(
                                      "Start!",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  child: Row(
                                    children: <Widget>[
                                      Text("Try", style: TextStyle(fontSize: 14)),
                                      Icon(Icons.keyboard_arrow_right, size: 16, color: Colors.orange),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: _courses.length,
        ),
      ),
    );
  }
}
