import 'package:flutter/material.dart';
import 'package:flutter_app/resources/pages/courses_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:nylo_framework/nylo_framework.dart';

class IntroductionPage extends NyStatefulWidget {
  static const path = '/introduction';

  IntroductionPage({super.key}) : super(path, child: _IntroductionPageState());
}

class _IntroductionPageState extends NyState<IntroductionPage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "アルダへようこそ！",
            body: "韓国語の単語学習をはじめましょう。",
            image: Center(child: SvgPicture.asset('public/assets/svg/undraw/undraw_studying_re_deca.svg', width: 200, height: 200)),
          ),
          PageViewModel(
            title: "Title of introduction page",
            body: "Welcome to the app! This is a description of how it works.",
            image: const Center(
              child: Icon(Icons.waving_hand, size: 50.0),
            ),
          )
        ],
        onDone: () {
          routeTo(CoursesPage.path);
        },
        done: const Text("Start"),
        next: const Text("Next"),
      ),
    );
  }
}
