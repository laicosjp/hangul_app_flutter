import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AnnouncementsPage extends NyStatefulWidget {
  static const path = '/announcements';
  
  AnnouncementsPage({super.key}) : super(path, child: _AnnouncementsPageState());
}

class _AnnouncementsPageState extends NyState<AnnouncementsPage> {

  @override
  init() async {

  }
  
  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Announcements")
      ),
      body: SafeArea(
         child: Container(),
      ),
    );
  }
}