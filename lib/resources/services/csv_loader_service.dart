import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class CsvLoaderService {
  Future<List<List<String>>> convertCsv({required String model}) async {
    final _rawCSV = await rootBundle.loadString("public/assets/csv/$model.csv");
    return CsvToListConverter().convert(_rawCSV).map((list) => list.map((item) => item.toString()).toList()).toList();
  }
}
