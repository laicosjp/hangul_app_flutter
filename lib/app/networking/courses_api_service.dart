import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/app/models/word.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CoursesApiService extends NyApiService {
  CoursesApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<List<Course>?> findAll() async {
    return await network<List<Course>>(
      request: (request) => request.get("/courses"),
      handleFailure: (DioException) {
        return [];
      },
    );
  }

  Future<Course?> findById(int id) async {
    String authorization = await NyStorage.read("authorization");

    return await network<Course>(
      request: (request) => request.get("/courses/$id"),
      headers: {'Authorization': 'Bearer ${authorization}'},
      handleFailure: (DioException) {
        return null;
      },
    );
  }

  Future<List<Word>?> findWithWords(int id) async {
    String authorization = await NyStorage.read("authorization");
    int WORD_NUMBER_PER_QUIZ = 10;

    return await network<List<Word>>(
      request: (Dio request) => request.get("/courses/$id/words?per_page=$WORD_NUMBER_PER_QUIZ"),
      headers: {'Authorization': 'Bearer ${authorization}'},
      handleFailure: (DioException DioException) {
        return null;
      },
    );
  }
}
