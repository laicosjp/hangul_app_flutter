import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:flutter_app/app/models/word.dart';

class CsvLoaderService {
  Future<List<Word>> getAllWords(String path) async {
    final _rawCSV = await rootBundle.loadString(path);
    final List<List<String>> _csvList = CsvToListConverter().convert(_rawCSV).map((list) => list.map((item) => item.toString()).toList()).toList();
    final List<Word> _words = _csvList.map((csvRow) => Word.fromCsv(csvRow)).toList();

    _words.forEach((word) {
      List<Word> _choices = [];

      _choices.add(word);

      while (_choices.length < 4) {
        Word randomWord = _words[Random().nextInt(_words.length)];
        if (!_choices.contains(randomWord)) {
          _choices.add(randomWord);
        }
      }

      word.choices.addAll(_choices..shuffle());
    });

    return _words;
  }
}
