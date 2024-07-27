import 'package:flutter/material.dart';
import 'package:flutter_app/resources/widgets/courses_widget.dart';
import 'package:flutter_app/resources/widgets/profile_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget {
  static const path = '/home';

  HomePage({super.key}) : super(path, child: _HomePageState());
}

class _HomePageState extends NyState<HomePage> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _pages = [
    {"title": "Home", "icon": Icons.home_outlined, "widget": Courses()},
    {"title": "Profile", "icon": Icons.person_outline, "widget": Profile()},
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
      appBar: AppBar(
        title: Text(_pages[_currentIndex]['title']),
      ),
      body: _pages[_currentIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _pages.map((page) {
          return BottomNavigationBarItem(
            icon: Icon(page['icon']),
            label: '',
          );
        }).toList(),
      ),
    );
  }
}
