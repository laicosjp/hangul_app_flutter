import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/resources/services/csv_loader_service.dart';

class WordsService extends CsvLoaderService {
  Future<List<Word>> findAll() async {
    final _csvList = await convertCsv(model: "words");
    final _words = _csvList.map((csvRow) => Word.fromCsv(csvRow)).toList();

    return _words;
  }

  Future<Word> findOne(int id) async {
    final _csvList = await convertCsv(model: "words");
    final _word = _csvList.map((csvRow) => Word.fromCsv(csvRow)).toList().firstWhere((word) => word.id == id);

    return _word;
  }
}
