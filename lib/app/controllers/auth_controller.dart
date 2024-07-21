import 'package:flutter_app/app/networking/auth_api_service.dart';
import 'package:flutter_login/flutter_login.dart' as flutter_login;
import 'package:nylo_framework/nylo_framework.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class AuthController extends Controller {
  AuthApiService _apiService = AuthApiService();

  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<String?> login(flutter_login.LoginData data) async {
    dynamic response = await _apiService.login(data);

    if (Auth.user() == null) {
      return response;
    }

    return null; // nullを返すと、flutter_loginでログイン成功とみなされる仕様
  }

  Future<String?> signup(flutter_login.SignupData data) async {
    dynamic response = await _apiService.signup(data);

    if (Auth.user() == null) {
      return response;
    }

    return null;  // nullを返すと、flutter_loginでサインアップ成功とみなされる仕様
  }

  Future<String?> recoverPassword(String name) async {
    return null;
  }
}
