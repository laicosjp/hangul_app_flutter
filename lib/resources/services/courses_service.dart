import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/resources/services/csv_loader_service.dart';

class CoursesService extends CsvLoaderService {
  Future<List<Course>> findAll() async {
    final List<List<String>> _csvList = await convertCsv(model: "courses");
    final _courses = _csvList.map((csvRow) => Course.fromCsv(csvRow)).toList();

    return _courses;
  }

  Future<Course> findOne(int id) async {
    final List<List<String>> _csvList = await convertCsv(model: "courses");
    final _courses = _csvList.map((csvRow) => Course.fromCsv(csvRow)).firstWhere((course) => course.id == id);

    return _courses;
  }
}
