import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/resources/services/csv_loder_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursePage extends NyStatefulWidget {
  static const path = '/course';

  CoursePage({super.key}) : super(path, child: _CoursePageState());
}

class _CoursePageState extends NyState<CoursePage> {
  final int PER_WORD = 10;
  // List<Word> _words = [];
  // final Map<int, List<Word>> _lessons = {};

  final List<Map<String, dynamic>> _lessons = [
    {
      "id": 1,
      "title": "Lesson 1",
      "words": [
        {
          "id": "1",
          "text": "Hello",
          "translation": "こんにちは",
          "choices": [
            {"id": "1", "text": "Hello", "translation": "こんにちは"},
            {"id": "301", "text": "future", "translation": "未来"},
            {"id": "302", "text": "good", "translation": "良い"},
            {"id": "302", "text": "better", "translation": "より良い"},
          ]
        },
        {
          "id": "2",
          "text": "I",
          "translation": "私",
          "choices": [
            {"id": "2", "text": "I", "translation": "私"},
            {"id": "301", "text": "past", "translation": "過去"},
            {"id": "302", "text": "bad", "translation": "悪い"},
            {"id": "302", "text": "rule", "translation": "ルール"},
          ]
        },
        {
          "id": "3",
          "text": "my",
          "translation": "私の",
          "choices": [
            {"id": "2", "text": "my", "translation": "私の"},
            {"id": "301", "text": "rank", "translation": "ランク"},
            {"id": "302", "text": "he", "translation": "彼"},
            {"id": "302", "text": "she", "translation": "彼女"},
          ]
        },
      ]
    },
  ];

  @override
  init() async {
    super.init();
    await _loadCSV();
    // _parseLessons();
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
    String course_id = queryParameters()['course_id'];
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
                        child: Text(_lessons[index]['title']),
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
