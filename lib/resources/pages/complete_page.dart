import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/lesson.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/services/lessons_service.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CompletePage extends NyStatefulWidget {
  static const path = '/complete';

  CompletePage({super.key}) : super(path, child: _CompletePageState());
}

class _CompletePageState extends NyState<CompletePage> {
  late Lesson _lesson;

  LessonsService _lessonsService = LessonsService();

  @override
  init() async {
    int lessonId = int.parse(widget.queryParameters()['lessonId']);
    _lesson = await _lessonsService.findOne(lessonId);
  }

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("結果発表！"), automaticallyImplyLeading: false),
      body: SafeAreaWidget(
        child: Column(
          children: [
            Container(child: Text('${_lesson.title}のレッスンを全て完了しました！')),
            Gap(20),
            OutlinedButton(
              onPressed: () {
                routeTo('/welcome');
              },
              child: Text('他のレッスンへ'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(ThemeColor.get(context).primaryContent),
                side: MaterialStateProperty.all(BorderSide(color: ThemeColor.get(context).primaryContent)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
