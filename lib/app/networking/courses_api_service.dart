import 'package:flutter/material.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';


class CoursesApiService extends NyApiService {
  CoursesApiService({BuildContext? buildContext}) : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<dynamic> fetchData() async {
    return await network(
        request: (request) => request.get("/courses"),
    );
  }
}
