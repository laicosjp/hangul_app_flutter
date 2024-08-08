import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/general_announcements_widget.dart';
import 'package:flutter_app/resources/widgets/personal_announcements_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AnnouncementsPage extends NyStatefulWidget {
  static const path = '/announcements';

  AnnouncementsPage({super.key})
      : super(path, child: _AnnouncementsPageState());
}

class _AnnouncementsPageState extends NyState<AnnouncementsPage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Notifications',
              style: TextStyle(color: Colors.white)),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(child: Text("For you")),
              Tab(child: Text("News")),
            ],
            dividerColor: Colors.orange,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
          ),
          backgroundColor: Colors.orange,
        ),
        body: const TabBarView(
          children: <Widget>[
            PersonalAnnouncements(),
            GeneralAnnouncements(),
          ],
        ),
      ),
    );
  }
}
