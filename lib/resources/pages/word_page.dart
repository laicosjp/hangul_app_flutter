import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordPage extends NyStatefulWidget {
  static const path = '/word';

  WordPage({super.key}) : super(path, child: _WordPageState());
}

class _WordPageState extends NyState<WordPage> {
  var _lesson;
  var _words = [];
  int _currentIndex = 0;

  @override
  init() async {
    super.init();
    _lesson = widget.data();
    _words = _lesson['words'];
  }

  // void _nextWord() {
  //   if (_currentIndex == _lesson.length - 1) {
  //     routeTo('/result');
  //   } else {
  //     setState(() {
  //       _currentIndex = (_currentIndex + 1) % _lesson.length;
  //     });
  //   }
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(queryParameters()['lesson_name'])),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  _words[_currentIndex]['text'].toString(),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(_words[_currentIndex]['choices'][0]['translation']),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(_words[_currentIndex]['choices'][1]['translation']),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(_words[_currentIndex]['choices'][2]['translation']),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(_words[_currentIndex]['choices'][2]['translation']),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
