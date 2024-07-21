import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import '/config/decoders.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_login/flutter_login.dart' as flutter_login;

class AuthApiService extends NyApiService {
  AuthApiService({BuildContext? buildContext}) : super(buildContext, decoders: modelDecoders);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<dynamic> login(flutter_login.LoginData data) async {
    return await network(
        request: (request) => request.post("/auth/sign_in", data: {
          'email': data.name, // flutter_loginの仕様でemailをnameで渡す
          'password': data.password,
        }),
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

  Future<dynamic> signup(flutter_login.SignupData data) async {
    return await network(
      request: (request) => request.post("/auth", data: {
        'email': data.name, // flutter_loginの仕様でemailをnameで渡す
        'password': data.password,
      }),
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
