import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/word.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ResultPage extends NyStatefulWidget {
  static const path = '/result';

  ResultPage({super.key}) : super(path, child: _ResultPageState());
}

class _ResultPageState extends NyState<ResultPage> {
  List<Word> _words = [];

  @override
  init() async {
    super.init();
    _words = widget.data();
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result"), automaticallyImplyLeading: false),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(flex: 1, child: Text("hello")),
              Expanded(
                flex: 4,
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
