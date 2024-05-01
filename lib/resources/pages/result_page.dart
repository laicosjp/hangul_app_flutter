import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
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
  final _player = AudioPlayer();

  @override
  init() async {
    super.init();
    _lesson = widget.data();
    _words = _lesson.words;
    _player.audioCache = AudioCache(prefix: 'public/assets/');
    _player.play(AssetSource("audio/yay.mp3"));
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result"), automaticallyImplyLeading: false),
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            children: [
              Text("お疲れさま！"),
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
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              routeTo('/course', queryParameters: {'course_id': _lesson.courseId.toString()});
                            },
                            child: Text("ホームヘ"),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(ThemeColor.get(context).primaryAccent),
                              side: MaterialStateProperty.all(BorderSide(color: ThemeColor.get(context).primaryAccent)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
                  Gap(10),
                  Expanded(
                      flex: 1,
                      child: Row(children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              routeTo('/course', queryParameters: {'course_id': _lesson.courseId.toString()});
                            },
                            child: Text("つぎのレッスンへ"),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(ThemeColor.get(context).primaryContent),
                              side: MaterialStateProperty.all(BorderSide(color: ThemeColor.get(context).primaryContent)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
