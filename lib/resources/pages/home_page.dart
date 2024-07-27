import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
        title: Text(_pages[_currentIndex]["title"]),
        automaticallyImplyLeading: false,
      ),
      body: _pages[_currentIndex]["widget"],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        color: Theme.of(context).primaryColor,
        items: <Widget>[
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
