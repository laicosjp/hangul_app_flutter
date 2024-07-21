import 'package:flutter_login/flutter_login.dart';

import '/app/controllers/controller.dart';
import 'package:flutter/widgets.dart';

class AuthController extends Controller {
  @override
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<String?> login(LoginData data) async {
    return null;
  }

  Future<String?> signup(SignupData data) async {
    return null;
  }

  Future<String?> recoverPassword(String name) async {
    return null;
  }
}
