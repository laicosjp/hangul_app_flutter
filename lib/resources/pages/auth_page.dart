import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/auth_controller.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_login/flutter_login.dart';

class AuthPage extends NyStatefulWidget {
  static const path = '/auth';

  AuthPage({super.key}) : super(path, child: _AuthPageState());
}

class _AuthPageState extends NyState<AuthPage> {
  final AuthController _controller = AuthController();

  @override
  init() async {}

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'Auth',
        onLogin: _controller.login,
        onSignup: _controller.signup,
        onSubmitAnimationCompleted: () {
          routeTo('/courses');
        },
        onRecoverPassword: _controller.recoverPassword,
      ),
    );
  }
}
