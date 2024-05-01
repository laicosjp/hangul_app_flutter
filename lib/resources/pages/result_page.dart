import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ResultPage extends NyStatefulWidget {
  static const path = '/result';

  ResultPage({super.key}) : super(path, child: _ResultPageState());
}

class _ResultPageState extends NyState<ResultPage> {
  List<Word> _words = [];
  final _player = AudioPlayer();
  FlutterTts _tts = FlutterTts();
  List<int> _correctWordIds = [];

  @override
  init() async {
    super.init();
    _words = widget.data();
    _shoutYay();
    _retrieveCorrectWordIds();
  }

  void _shoutYay() {
    _player.audioCache = AudioCache(prefix: 'public/assets/');
    _player.play(AssetSource("audio/yay.mp3"));
  }

  void _retrieveCorrectWordIds() async {
    _correctWordIds = await NyStorage.readCollection("correctWordIds");
  }

  bool _checkResult(Word word) {
    return _correctWordIds.contains(word.id);
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
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          routeTo('/home');
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
                      trailing: _checkResult(_words[index]) ? Icon(CupertinoIcons.checkmark, color: Colors.green) : Icon(CupertinoIcons.clear, color: Colors.blue),
                      onTap: () {
                        _tts.speak(_words[index].text);
                      },
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
