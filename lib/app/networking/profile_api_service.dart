import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ProfileApiService extends NyApiService {
  ProfileApiService({BuildContext? buildContext})
      : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<User?> fetchData() async {
    String authorization = await NyStorage.read("authorization");
    return await network<User>(
        request: (request) => request.get("/profile"),
        headers: {'Authorization': authorization},
        handleFailure: (DioException) {
          return null;
        });
  }
}
