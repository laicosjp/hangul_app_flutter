import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({super.key, required this.user});

  static String state = "profile";

  @override
  createState() => _ProfileState();
}

class _ProfileState extends NyState<Profile> {
  final HomeController _controller = HomeController();

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
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.email,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ],
              ),
            ),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFF2F4FA),
              ),
              child: ListTile(
                leading: Icon(Icons.notifications_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text("Notifications"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFF2F4FA),
              ),
              child: ListTile(
                leading: Icon(Icons.info_outline),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text("Privaciy Policy"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFF2F4FA),
              ),
              child: ListTile(
                leading: Icon(Icons.support_agent_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text("Help Center"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFF2F4FA),
              ),
              child: ListTile(
                  leading: Icon(Icons.logout_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text("Logout"),
                  onTap: () {
                    _controller.onLogout();
                  }),
            ),
          ),
        ],
      ),
    ));
  }
}
