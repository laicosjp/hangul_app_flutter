import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CourcesPage extends NyStatefulWidget {
  static const path = '/cources';

  CourcesPage({super.key}) : super(path, child: _CourcesPageState());
}

class _CourcesPageState extends NyState<CourcesPage> {
  final List<String> courses = ['ハングル検定5級', 'ハングル検定4級'];

  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("コース")),
      body: SafeArea(
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(courses[index]),
              onTap: () {
                // ここに各コースがタップされた時の処理を書く
              },
            );
          },
        ),
      ),
    );
  }
}
