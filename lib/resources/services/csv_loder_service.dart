import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:flutter_app/app/models/word.dart';

class CsvLoaderService {
  Future<List<Word>> getAllWords(String path) async {
    final rawCSV = await rootBundle.loadString(path);
    final List<List<dynamic>> csvList =
        const CsvToListConverter().convert(rawCSV);

    final List<Word> _words = csvList.map((e) => Word.fromCsv(e)).toList();

    return _words;
  }
}
