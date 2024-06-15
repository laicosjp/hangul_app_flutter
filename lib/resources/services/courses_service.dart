import 'package:flutter_app/app/models/course.dart';
// import 'package:flutter_app/resources/services/csv_loader_service.dart';
import 'package:flutter_app/resources/services/data_loader_service.dart';

// class CoursesService extends CsvLoaderService {
//   Future<List<Course>> findAll() async {
//     final List<List<String>> _csvList = await convertCsv(model: "courses");
//     final _courses = _csvList.map((csvRow) => Course.fromCsv(csvRow)).where((course) => course.isPublished).toList();

//     return _courses;
//   }

//   Future<Course> findOne(int id) async {
//     final List<List<String>> _csvList = await convertCsv(model: "courses");
//     final _courses = _csvList.map((csvRow) => Course.fromCsv(csvRow)).firstWhere((course) => course.id == id);

//     return _courses;
//   }
// }

class CoursesService extends DataLoaderService {
  static const COURSE_JSON_FILES = [
    'data/hangulFifthTest.json',
    'data/hangulFourthTest.json',
    'data/hangulThirdTest.json',
    'data/hangulSecondTest.json',
    'data/hangulFirstTest.json',
  ];

  Future<List<Course>> findAll() async {
    final _jsonList = await jsonList(COURSE_JSON_FILES);
    final List<Course> _courses = _jsonList.map((item) => Course.fromJson(item)).toList();

    return _courses;
  }

  Future<Course> findOneByPath(String path) async {
    final _jsonList = await jsonList([path]);
    final _course = _jsonList.map((item) => Course.fromJson(item)).toList().first;

    return _course;
  }
}
