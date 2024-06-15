import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nylo_framework/nylo_framework.dart';

class DataLoaderService {
  Future<List<dynamic>> jsonList(List<String> paths) async {
    List<dynamic> decodedJson = [];
    for (String path in paths) {
      String data = await rootBundle.loadString(getPublicAsset(path));
      decodedJson.add(jsonDecode(data));
    }

    return decodedJson;
  }
}
