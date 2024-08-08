import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class PersonalAnnouncements extends StatefulWidget {
  const PersonalAnnouncements({super.key});

  static String state = "personal_announcements";

  @override
  createState() => _PersonalAnnouncementsState();
}

class _PersonalAnnouncementsState extends NyState<PersonalAnnouncements> {
  _PersonalAnnouncementsState() {
    stateName = PersonalAnnouncements.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(PersonalAnnouncements.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return SafeAreaWidget(child: Text("No Announcements"));
  }
}
