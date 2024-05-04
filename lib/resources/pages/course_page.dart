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
  late List<Map<int, double>> learningProgresses = [];

  int currentLessonPosition = 0;

  @override
  init() async {
    super.init();
    _lessons = await _lessonsService.findAll(courseId: int.parse(queryParameters()['course_id']));
    course = await _coursesService.findOne(int.parse(queryParameters()['course_id']));
    await setLearningProgress();
  }

  Future<void> setLearningProgress() async {
    for (Lesson lesson in _lessons) {
      List<int> learnedWordIds = await lesson.learnedWordIds();
      double percent = double.parse((learnedWordIds.length / lesson.words.length * 100).toStringAsFixed(1));
      learningProgresses.add({lesson.id: percent});
    }
  }

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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _lessons.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              currentLessonPosition = index;
                            });
                          },
                          child: CircularPercentIndicator(
                            radius: 26.0,
                            lineWidth: 7,
                            percent: learningProgresses[index].values.last / 100,
                            center: Text("${index + 1}", style: TextStyle(fontWeight: FontWeight.w600)),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.lightGreen,
                          ),
                        ),
                        Gap(16),
                      ],
                    );
                  },
                ),
              ),
              Gap(40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("${course.title} ${_lessons[currentLessonPosition].title}", style: TextStyle(fontWeight: FontWeight.w600)),
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
                          percent: learningProgresses[currentLessonPosition].values.last / 100,
                          center: Center(
                            child: Text(
                              "${learningProgresses[currentLessonPosition].values.last}%",
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
                                  Text("${learningProgresses[currentLessonPosition].values.last}", style: TextStyle(fontSize: 34)),
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
                                  Text("${(100 - (learningProgresses[currentLessonPosition].values.last)).toStringAsFixed(1)}", style: TextStyle(fontSize: 24)),
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
                      child: learningProgresses[currentLessonPosition].values.last == 100
                          ? ElevatedButton(
                              onPressed: () async {
                                Lesson _lesson = _lessons[currentLessonPosition];
                                List<int> _learnedWordIds = await _lesson.learnedWordIds();
                                await NyStorage.deleteFromCollectionWhere((id) => _learnedWordIds.contains(id), key: 'correctWordIds');

                                routeTo('/word', queryParameters: {"lessonId": _lesson.id.toString()});
                              },
                              child: Text("総復習"),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                routeTo('/word', queryParameters: {"lessonId": _lessons[currentLessonPosition].id.toString()});
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
