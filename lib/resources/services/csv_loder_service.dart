import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/app/models/lesson.dart';
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

  Future<List<Lesson>> getLessons({required int courseId}) async {
    final path = "public/assets/csv/lessons.csv";
    final _rawCSV = await rootBundle.loadString(path);
    final List<List<String>> _csvList = CsvToListConverter().convert(_rawCSV).map((list) => list.map((item) => item.toString()).toList()).toList();
    final List<Lesson> _lessons = _csvList.map((csvRow) => Lesson.fromCsv(csvRow)).where((lesson) => lesson.courseId == courseId).toList();
    final List<Word> _words = await getAllWords("public/assets/csv/word_${courseId}.csv");

    _lessons.forEach((lesson) {
      lesson.words.addAll(_words.where((word) => word.lessonId == lesson.id).toList());
    });

    return _lessons;
  }

  Future<List<Course>> getAllCourses() async {
    final path = "public/assets/csv/courses.csv";
    final _rawCSV = await rootBundle.loadString(path);
    final List<List<String>> _csvList = CsvToListConverter().convert(_rawCSV).map((list) => list.map((item) => item.toString()).toList()).toList();
    final List<Course> _courses = _csvList.map((csvRow) => Course.fromCsv(csvRow)).toList();

    return _courses;
  }
}
