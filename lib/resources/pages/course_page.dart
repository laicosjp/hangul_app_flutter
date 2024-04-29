import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/services/csv_loder_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursePage extends NyStatefulWidget {
  static const path = '/course';

  CoursePage({super.key}) : super(path, child: _CoursePageState());
}

class _CoursePageState extends NyState<CoursePage> {
  final int PER_WORD = 10;
  List<Word> _allWords = [];
  List<Lesson> _lessons = [];
  int courseId = 0;

  @override
  init() async {
    super.init();

    courseId = int.parse(queryParameters()['course_id']);
    _allWords = await CsvLoaderService().getAllWords("public/assets/csv/word_$courseId.csv");
    _parseLessons();
  }

  void _parseLessons() {
    for (int i = 0; i < _allWords.length; i += PER_WORD) {
      int lessonNumber = (i ~/ PER_WORD) + 1;
      List<Word> wordsForLesson = _allWords.sublist(i, i + PER_WORD > _allWords.length ? _allWords.length : i + PER_WORD);
      _lessons.add(Lesson(id: lessonNumber, title: "Lesson $lessonNumber", words: wordsForLesson, courseId: courseId));
    }
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
                      int lessonNumber = index + 1;
                      return OutlinedButton(
                          onPressed: () {
                            routeTo('/word', data: _lessons[index], queryParameters: {
                              "lesson_name": "Lesson $lessonNumber",
                            });
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
