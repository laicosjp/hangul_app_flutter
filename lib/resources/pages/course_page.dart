import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/resources/services/courses_service.dart';
import 'package:flutter_app/resources/services/lessons_service.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CoursePage extends NyStatefulWidget {
  static const path = '/course';

  CoursePage({super.key}) : super(path, child: _CoursePageState());
}

class _CoursePageState extends NyState<CoursePage> {
  final _lessonsService = LessonsService();
  final _coursesService = CoursesService();

  late List<Lesson> _lessons = [];
  late Course course;

  @override
  init() async {
    super.init();
    _lessons = await _lessonsService.findAll(courseId: int.parse(queryParameters()['course_id']));
    course = await _coursesService.findOne(int.parse(queryParameters()['course_id']));
  }

  // @override
  // Widget view(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text("単語一覧"), automaticallyImplyLeading: false),
  //     body: SafeArea(
  //       child: Container(
  //           padding: EdgeInsets.all(20),
  //           child: Column(
  //             children: [
  //               Expanded(
  //                 child: GridView.builder(
  //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                     crossAxisCount: 2, // 2つのアイテムを横に並べる
  //                     crossAxisSpacing: 10, // 横のスペース
  //                     mainAxisSpacing: 10, // 縦のスペース
  //                     childAspectRatio: 4.0,
  //                   ),
  //                   itemCount: _lessons.length,
  //                   itemBuilder: (context, index) {
  //                     return OutlinedButton(
  //                         onPressed: () {
  //                           routeTo('/word', queryParameters: {"lessonId": _lessons[index].id.toString()});
  //                         },
  //                         child: Text(_lessons[index].title),
  //                         style: OutlinedButton.styleFrom(
  //                           side: BorderSide(color: ThemeColor.get(context).primaryAccent),
  //                           foregroundColor: ThemeColor.get(context).buttonPrimaryContent,
  //                         ));
  //                   },
  //                 ),
  //               ),
  //             ],
  //           )),
  //     ),
  //   );
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 7,
                      percent: 0.8,
                      center: Text("1", style: TextStyle(fontWeight: FontWeight.w600)),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.lightGreen,
                    ),
                    Gap(16),
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 7,
                      percent: 0.3,
                      center: Text("2", style: TextStyle(fontWeight: FontWeight.w600)),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.lightGreen,
                    ),
                    Gap(16),
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 7,
                      percent: 0.0,
                      center: Text("3", style: TextStyle(fontWeight: FontWeight.w600)),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.lightGreen,
                    ),
                    Gap(16),
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 7,
                      percent: 0.0,
                      center: Text("4", style: TextStyle(fontWeight: FontWeight.w600)),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.lightGreen,
                    ),
                    Gap(16),
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 7,
                      percent: 0.0,
                      center: Text("5", style: TextStyle(fontWeight: FontWeight.w600)),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.lightGreen,
                    ),
                    Gap(16),
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 7,
                      percent: 0.0,
                      center: Text("6", style: TextStyle(fontWeight: FontWeight.w600)),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.lightGreen,
                    ),
                    Gap(16),
                    CircularPercentIndicator(
                      radius: 26.0,
                      lineWidth: 7,
                      percent: 0.0,
                      center: Text("7", style: TextStyle(fontWeight: FontWeight.w600)),
                      backgroundColor: Colors.grey,
                      progressColor: Colors.lightGreen,
                    ),
                  ],
                ),
              ),
              Gap(40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("${course.title} Lesson1", style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              Gap(20),
              Container(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: CircularPercentIndicator(
                          radius: 80.0,
                          lineWidth: 14,
                          percent: 0.8,
                          center: Center(
                            child: Text(
                              "80%",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          backgroundColor: Colors.grey,
                          progressColor: Colors.lightGreen,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.lightGreen,
                                    size: 18,
                                  ),
                                  Text("覚えた", style: TextStyle(fontSize: 14)),
                                  Spacer(),
                                  Text("80", style: TextStyle(fontSize: 34)),
                                  Gap(4),
                                  Text("%")
                                ],
                              )),
                              Expanded(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  Text("未修得", style: TextStyle(fontSize: 14)),
                                  Spacer(),
                                  Text("20", style: TextStyle(fontSize: 24)),
                                  Gap(4),
                                  Text("%")
                                ],
                              )),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Gap(20),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("苦手"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.white),
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          routeTo('/word', queryParameters: {"lessonId": _lessons[0].id.toString()});
                        },
                        child: Text("未学習"),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                      ),
                    )
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
