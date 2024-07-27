import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/profile_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  static String state = "profile";

  @override
  createState() => _ProfileState();
}

class _ProfileState extends NyState<Profile> {
  final ProfileApiService _apiService = ProfileApiService();
  late User _user;

  _ProfileState() {
    stateName = Profile.state;
  }

  @override
  boot() async {
    _user = await _apiService.fetchData();
  }

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(Profile.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
            "My email is...${_user.email}  / authorization: ${Backpack.instance.read("authorization")}"),
      ),
    );
  }
}
