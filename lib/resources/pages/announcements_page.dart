import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          title: const Text('Notifications'),
          shape: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(child: Text("For you")),
              Tab(child: Text("News")),
            ],
            dividerColor: Colors.white,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.orange,
            indicatorColor: Colors.orange,
          ),
          backgroundColor: Colors.white,
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
