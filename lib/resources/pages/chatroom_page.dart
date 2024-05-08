import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatroomPage extends NyStatefulWidget {
  static const path = '/chatroom';

  ChatroomPage({super.key}) : super(path, child: _ChatroomPageState());
}

class _ChatroomPageState extends NyState<ChatroomPage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text("ワードリリックのタイトル")),
        body: Chat(
          theme: DefaultChatTheme(
            primaryColor: ThemeColor.get(context).primaryContent,
            inputBackgroundColor: ThemeColor.get(context).primaryContent,
            userAvatarNameColors: [ThemeColor.get(context).primaryContent],
          ),
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      );
}
