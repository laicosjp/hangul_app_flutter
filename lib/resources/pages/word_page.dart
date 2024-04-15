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
    if (_currentIndex == _words.length - 1) {
      routeTo('/result');
    } else {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _words.length;
      });
    }
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(queryParameters()['lesson_name'])),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                _words[_currentIndex][1].toString(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('ワイルス'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('コンクール'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('スキー'),
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.orange),
                    ),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('フード'),
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
