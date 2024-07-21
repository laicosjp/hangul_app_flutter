import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';


class AuthApiService extends NyApiService {
  AuthApiService({BuildContext? buildContext}) : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<dynamic> login() async {
    return await network(
        request: (request) => request.post("/auth/sign_in"),
        handleSuccess: (response) async {
          User user = User.fromJson(response.data);
          await Auth.set(user);

          return user;
        },
        handleFailure: (DioException dioError) {

          return dioError.response?.data['errors'].join(',');
        },
    );
  }
}
