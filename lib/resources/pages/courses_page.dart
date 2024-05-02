import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/resources/services/courses_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursesPage extends NyStatefulWidget {
  static const path = '/courses';

  CoursesPage({super.key}) : super(path, child: _CoursesPageState());
}

class _CoursesPageState extends NyState<CoursesPage> {
  final _coursesService = CoursesService();
  List<Course> courses = [];

  @override
  init() async {
    courses = await _coursesService.findAll();
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
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: NetworkImage("https://pbs.twimg.com/media/GMU4OtFW0AEa3Rk?format=jpg&name=large"),
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
                          Text(courses[position].title, style: TextStyle(fontWeight: FontWeight.w600)),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.timelapse, size: 16, color: Colors.orange),
                                  SizedBox(width: 2),
                                  Text(
                                    "04 / 100",
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
            );
          },
          itemCount: courses.length,
        ),
      ),
    );
  }
}
