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

  final List<Map<String, dynamic>> chatrooms = [
    {'name': '山田 太郎', 'lastMessage': 'こんにちは！'},
    {'name': '鈴木 一郎', 'lastMessage': 'プロジェクトの更新がありますか？'},
    {'name': '佐藤 花子', 'lastMessage': '昨日の会議について'},
  ];

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
      appBar: AppBar(title: Text('ワードリリック'), automaticallyImplyLeading: false),
      body: SafeAreaWidget(
        child: Container(
          child: ListView.builder(
            itemCount: chatrooms.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(chatrooms[index]['name'][0]),
                ),
                title: Text(chatrooms[index]['name']),
                subtitle: Text(chatrooms[index]['lastMessage']),
                onTap: () {
                  print('チャットルーム ${chatrooms[index]['name']} が選択されました');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
