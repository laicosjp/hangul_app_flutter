import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ResultPage extends NyStatefulWidget {
  static const path = '/result';

  ResultPage({super.key}) : super(path, child: _ResultPageState());
}

class _ResultPageState extends NyState<ResultPage> {
  var _lesson;
  List<Word> _words = [];

  @override
  init() async {
    super.init();
    _lesson = widget.data();
    _words = _lesson.words;
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result"), automaticallyImplyLeading: false),
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          routeTo('/course', queryParameters: {'course_id': _lesson.courseId.toString()});
                        },
                        child: Text("Home"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    )
                  ])),
              Expanded(
                flex: 9,
                child: ListView.builder(
                  itemCount: _words.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_words[index].text + " （" + _words[index].translation + "）"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
