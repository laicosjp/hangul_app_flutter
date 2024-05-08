import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/helpers.dart';
import 'package:flutter_app/resources/widgets/chatrooms_widget.dart';
import 'package:flutter_app/resources/widgets/courses_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WelcomePage extends NyStatefulWidget {
  static const path = '/welcome';

  WelcomePage({super.key}) : super(path, child: _WelcomePageState());
}

class _WelcomePageState extends NyState<WelcomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Container(child: Courses()),
    Container(child: Chatrooms()),
  ];

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
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: ThemeColor.get(context).primaryContent,
        unselectedItemColor: ThemeColor.get(context).primaryAccent,
        selectedIconTheme: IconThemeData(color: ThemeColor.get(context).primaryContent),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.translate_rounded),
            label: 'Word',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
