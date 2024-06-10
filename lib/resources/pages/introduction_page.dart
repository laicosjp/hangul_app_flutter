import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
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
            image: Center(
                child: SvgPicture.asset(
              getPublicAsset('svg/undraw/undraw_studying_re_deca.svg'),
              width: 200,
              height: 200,
            )),
            // decoration: const PageDecoration(
            //   pageColor: Colors.white,
            // ),
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
        done: Text("Start", style: TextStyle(color: ThemeColor.get(context).primaryContent)),
        next: Text("Next", style: TextStyle(color: ThemeColor.get(context).primaryContent)),
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: ThemeColor.get(context).primaryContent,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}
