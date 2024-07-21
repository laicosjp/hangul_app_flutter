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
        logo: AssetImage('public/assets/app_icon/icon_without_bg_color.png'),
        title: 'Learn words without effort!',
        onLogin: (loginData) async => await _controller.login(loginData),
        // onSignup: (signupData) => _controller.signup(signupData, context),
        onSubmitAnimationCompleted: () {
          routeTo('/courses');
        },
        onRecoverPassword: _controller.recoverPassword,
        theme: LoginTheme(
          titleStyle: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
      ),
    );
  }
}
