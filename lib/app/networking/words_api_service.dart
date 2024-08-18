import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/word.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WordsApiService extends NyApiService {
  WordsApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<List<Word>?> findAll() async {
    String authorization = await NyStorage.read("authorization");
    int WORD_NUMBER_PER_QUIZ = 10;

    return await network<List<Word>>(
      request: (request) => request.get("/courses/17/words?per_page=${WORD_NUMBER_PER_QUIZ}"),
      headers: {'Authorization': 'Bearer ${authorization}'},
      handleFailure: (DioException) {
        return [];
      },
    );
  }
}
