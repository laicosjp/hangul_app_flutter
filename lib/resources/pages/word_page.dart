import 'package:flutter/material.dart';
import 'package:flutter_app/resources/services/csv_loder_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordPage extends NyStatefulWidget {
  static const path = '/word';

  WordPage({super.key}) : super(path, child: _WordPageState());
}

class _WordPageState extends NyState<WordPage> {
  List<List<dynamic>> _words = [];
  int _currentIndex = 0;

  @override
  init() async {
    super.init();
    _words = widget.data();
  }

  void _nextWord() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _words.length;
    });
  }

  void _previousWord() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _words.length) % _words.length;
    });
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Word")),
      body: SafeArea(
        child: _words.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_words[_currentIndex][1]),
                  Text(_words[_currentIndex][2].toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: _previousWord,
                        child: Text('戻る'),
                      ),
                      ElevatedButton(
                        onPressed: _nextWord,
                        child: Text('次へ'),
                      ),
                    ],
                  )
                ],
              )
            : Center(child: Text('単語がありません')),
      ),
    );
  }
}
