import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class CsvLoaderService {
  Future<List<List<dynamic>>> loadCsvData(String path) async {
    final rawCSV = await rootBundle.loadString(path);
    List<List<dynamic>> csvList = const CsvToListConverter().convert(rawCSV);
    return csvList;
  }
}
