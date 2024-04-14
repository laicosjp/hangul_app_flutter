import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CourcesPage extends NyStatefulWidget {
  static const path = '/cources';

  CourcesPage({super.key}) : super(path, child: _CourcesPageState());
}

class _CourcesPageState extends NyState<CourcesPage> {
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
      appBar: AppBar(title: Text("Cources")),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
