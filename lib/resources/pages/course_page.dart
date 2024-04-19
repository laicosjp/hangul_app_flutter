import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/app/models/word.dart';
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

  @override
  init() async {
    super.init();
    await _loadCSV();
    // _parseLessons();

    // ====
    String course_id = queryParameters()['course_id'];
    _allWords = await CsvLoaderService().getAllWords("public/assets/csv/hangul_test_$course_id.csv");
    _lessons = [Lesson(id: 1, title: "Lesson 1", words: _allWords)];
  }

  // void _parseLessons() {
  //   int lessonNumber = 1;
  //   for (int i = 0; i < _words.length; i += PER_WORD) {
  //     _lessons[lessonNumber] = _words.sublist(i, i + PER_WORD > _words.length ? _words.length : i + PER_WORD);
  //     lessonNumber++;
  //   }
  //   setState(() {});
  // }

  Future<void> _loadCSV() async {
    // _words = await CsvLoaderService().getAllWords("public/assets/csv/hangul_test_$course_id.csv");

    setState(() {});
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("単語一覧")),
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
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
