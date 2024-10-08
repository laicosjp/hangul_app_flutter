import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/course.dart';
import 'package:flutter_app/app/models/user.dart';
import 'package:flutter_app/app/networking/courses_api_service.dart';
import 'package:flutter_app/app/networking/profile_api_service.dart';
import 'package:flutter_app/resources/widgets/courses_widget.dart';
import 'package:flutter_app/resources/widgets/profile_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class HomePage extends NyStatefulWidget {
  static const path = '/home';

  HomePage({super.key}) : super(path, child: _HomePageState());
}

class _HomePageState extends NyState<HomePage> {
  final ProfileApiService _profileApiService = ProfileApiService();
  final CoursesApiService _coursesApiService = CoursesApiService();
  final List<Map<String, dynamic>> _pages = [];
  int _currentIndex = 0;

  User? _user;
  List<Course>? _courses;

  @override
  init() async {
    _user = await _profileApiService.fetchData();
    _courses = await _coursesApiService.findAll();

    setState(() {
      _pages.addAll([
        {
          "title": "Home",
          "icon": Icons.home_outlined,
          "widget": CoursesWidget(courses: _courses ?? []),
        },
        {
          "title": "Profile",
          "icon": Icons.person_outline,
          "widget": Profile(email: _user?.email)
        },
      ]);
    });
  }

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
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
