import 'package:flutter/material.dart';
import 'package:flutter_app/app/networking/general_announcements_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class GeneralAnnouncements extends StatefulWidget {
  const GeneralAnnouncements({super.key});

  static String state = "general_announcements";

  @override
  createState() => _GeneralAnnouncementsState();
}

class _GeneralAnnouncementsState extends NyState<GeneralAnnouncements> {
  final _apiService = GeneralAnnouncementsApiService();

  _GeneralAnnouncementsState() {
    stateName = GeneralAnnouncements.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(GeneralAnnouncements.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NyListView(child: (BuildContext context, dynamic data) {
          return ListTile(title: Text(data.title));
        }, data: () async {
          // return _general_announcements;
          return await _apiService.findAll();
        }),
      ),
    );
  }
}
