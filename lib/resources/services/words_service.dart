import 'dart:math';
import 'package:flutter_app/app/models/word.dart';
import 'package:flutter_app/resources/services/csv_loader_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordsService extends CsvLoaderService {
  Future<List<Word>> findAll({int? lessonId, bool? onlyNew}) async {
    final _csvList = await convertCsv(model: "words");
    List<Word> _words = _csvList.map((csvRow) => Word.fromCsv(csvRow)).toList();

    _words.forEach((word) => _assignRandomChoices(word, _words));

    if (lessonId != null) {
      _words = _words.where((word) => word.lessonId == lessonId).toList();
    }

    if (onlyNew == true) {
      List<int> _wordIds = await _learnedWordIds();
      _words = _words.where((word) => !_wordIds.contains(word.id)).toList();
    }

    return _words;
  }

  Future<Word> findOne(int id) async {
    final _csvList = await convertCsv(model: "words");
    final _word = _csvList.map((csvRow) => Word.fromCsv(csvRow)).toList().firstWhere((word) => word.id == id);

    return _word;
  }

  void _assignRandomChoices(Word word, List<Word> allWords) {
    List<Word> _choices = [word];
    Set<int> usedIndexes = {allWords.indexOf(word)};

    while (_choices.length < 4) {
      int randomIndex = Random().nextInt(allWords.length);
      if (!usedIndexes.contains(randomIndex)) {
        _choices.add(allWords[randomIndex]);
        usedIndexes.add(randomIndex);
      }
    }

    word.choices.addAll(_choices..shuffle());
  }

  Future<List<int>> _learnedWordIds() async {
    List<int> _correctWordIds = await NyStorage.readCollection("correctWordIds");

    return _correctWordIds;
  }
}
