import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class WelcomePage extends NyStatefulWidget {
  static const path = '/welcome';
  
  WelcomePage({super.key}) : super(path, child: _WelcomePageState());
}

class _WelcomePageState extends NyState<WelcomePage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    Container(child: Text("Tab 1"),),
    Container(child: Text("Tab 2"),),

  ];

  @override
  init() async {

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
        title: Text('Welcome'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 2',
          ),

        ],
      ),
    );
  }
}

