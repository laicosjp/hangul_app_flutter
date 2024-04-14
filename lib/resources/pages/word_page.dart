import 'package:flutter/material.dart';
import 'package:flutter_app/resources/services/csv_loder_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordPage extends NyStatefulWidget {
  static const path = '/word';

  WordPage({super.key}) : super(path, child: _WordPageState());
}

class _WordPageState extends NyState<WordPage> {
  List<List<dynamic>> _words = [];

  @override
  init() async {
    super.init();
    _words = widget.data();
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Word")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_words[index][1]),
              subtitle: Text(_words[index][2].toString()),
            );
          },
        ),
      ),
    );
  }
}
