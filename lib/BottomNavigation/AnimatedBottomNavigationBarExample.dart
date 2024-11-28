import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedBottomNavigationBarExample extends StatefulWidget {
  @override
  _AnimatedBottomNavigationBarExampleState createState() =>
      _AnimatedBottomNavigationBarExampleState();
}

class _AnimatedBottomNavigationBarExampleState
    extends State<AnimatedBottomNavigationBarExample> {
  int _currentIndex = 0;
  final _iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.person,
  ];

  final _pageList = <Widget>[
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Notifications')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Bottom Navigation Bar"),
      ),
      body: _pageList[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action for FAB
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.grey,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            if(_currentIndex==0)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("ApiLabels.0"),
                  duration: Duration(seconds: 1),
                ),
              );
            }
          });
        },
      ),
    );
  }
}