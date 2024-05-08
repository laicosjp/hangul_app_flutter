import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class NewChatroomPage extends NyStatefulWidget {
  static const path = '/new-chatroom';

  NewChatroomPage({super.key}) : super(path, child: _NewChatroomPageState());
}

class _NewChatroomPageState extends NyState<NewChatroomPage> {
  @override
  init() async {}

  /// Use boot if you need to load data before the [view] is rendered.
  // @override
  // boot() async {
  //
  // }

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("新しいワードリリックを作成")),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
