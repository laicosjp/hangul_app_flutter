import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/services/csv_loder_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordPage extends NyStatefulWidget {
  static const path = '/word';

  WordPage({super.key}) : super(path, child: _WordPageState());
}

class _WordPageState extends NyState<WordPage> {
  List<List<dynamic>> _data = [];

  @override
  init() async {
    super.init();
    await _loadCSV();
  }

  Future<void> _loadCSV() async {
    CsvLoaderService csvLoader = CsvLoaderService();
    _data = await csvLoader.loadCsvData('public/assets/csv/hangul_test_5.csv');
    setState(() {});
  }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Word")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_data[index][1]),
              subtitle: Text(_data[index][2].toString()),
            );
          },
        ),
      ),
    );
  }
}
