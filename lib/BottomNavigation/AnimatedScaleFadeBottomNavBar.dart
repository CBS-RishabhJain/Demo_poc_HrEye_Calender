import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedScaleFadeBottomNavBar extends StatefulWidget {
  @override
  _AnimatedScaleFadeBottomNavBarState createState() =>
      _AnimatedScaleFadeBottomNavBarState();
}

class _AnimatedScaleFadeBottomNavBarState
    extends State<AnimatedScaleFadeBottomNavBar> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search', style: TextStyle(fontSize: 24))),
    Center(child: Text('Favorites', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
    Center(child: Text('Account', style: TextStyle(fontSize: 24))),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
    Icons.no_accounts,
  ];

  final List<String> _labels = ['Home', 'Search', 'Favorites', 'Profile','Account'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildAnimatedBottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBottomNavBar() {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange,
        //borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          bool isSelected = _currentIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                _currentIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedScale(
                    scale: isSelected ? 1.5 : 1.0,
                    duration: Duration(milliseconds: 300),
                    child: Icon(
                      _icons[index],
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  AnimatedOpacity(
                    opacity: isSelected ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      _labels[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}