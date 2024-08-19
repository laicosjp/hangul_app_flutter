import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/result_controller.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:gap/gap.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ResultPage extends NyStatefulWidget<ResultController> {
  static const path = '/result';

  ResultPage({super.key}) : super(path, child: _ResultPageState());
}

class _ResultPageState extends NyState<ResultPage> {
  List<Word> _words = [];
  FlutterTts _tts = FlutterTts();

  @override
  init() async {
    super.init();
    _words = widget.data();
    widget.controller.playAudio('audio/yay.mp3');
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("お疲れさま！"), automaticallyImplyLeading: false),
      body: SafeAreaWidget(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView.builder(
                  itemCount: _words.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_words[index].name + " （" + _words[index].answer + "）"),
                      onTap: () {
                        _tts.speak(_words[index].name);
                      },
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
                              routeTo('/home');
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
