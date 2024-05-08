import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/safearea_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class Chatrooms extends StatefulWidget {
  const Chatrooms({super.key});

  static String state = "chatrooms";

  @override
  createState() => _ChatroomsState();
}

class _ChatroomsState extends NyState<Chatrooms> {
  _ChatroomsState() {
    stateName = Chatrooms.state;
  }

  @override
  init() async {}

  @override
  stateUpdated(dynamic data) async {
    // e.g. to update this state from another class
    // updateState(Chatrooms.state, data: "example payload");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('チャット一覧'), automaticallyImplyLeading: false),
      body: SafeAreaWidget(
        child: Container(child: Column(children: [Text("Hello")])),
      ),
    );
  }
}
