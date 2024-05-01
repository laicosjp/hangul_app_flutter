import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/services/csv_loader_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursePage extends NyStatefulWidget {
  static const path = '/course';

  CoursePage({super.key}) : super(path, child: _CoursePageState());
}

class _CoursePageState extends NyState<CoursePage> {
  final int PER_WORD = 10;
  List<Lesson> _lessons = [];
  int courseId = 0;

  @override
  init() async {
    super.init();

    courseId = int.parse(queryParameters()['course_id']);
    _lessons = await CsvLoaderService().getLessons(courseId: courseId);
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("単語一覧"), automaticallyImplyLeading: false),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2つのアイテムを横に並べる
                      crossAxisSpacing: 10, // 横のスペース
                      mainAxisSpacing: 10, // 縦のスペース
                      childAspectRatio: 4.0,
                    ),
                    itemCount: _lessons.length,
                    itemBuilder: (context, index) {
                      return OutlinedButton(
                          onPressed: () {
                            routeTo('/word', queryParameters: {"lessonId": _lessons[index].id.toString()});
                          },
                          child: Text(_lessons[index].title),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: ThemeColor.get(context).primaryAccent),
                            foregroundColor: ThemeColor.get(context).buttonPrimaryContent,
                          ));
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
