import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  static String state = "profile";

  @override
  createState() => _ProfileState();
}

class _ProfileState extends NyState<Profile> {
  _ProfileState() {
    stateName = Profile.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(Profile.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("My name is higakijin"),
      ),
    );
  }
}
