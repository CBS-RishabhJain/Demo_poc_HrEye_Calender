import 'package:flutter/material.dart';

class CustomAnimatedBottomNavBar extends StatefulWidget {
  @override
  _CustomAnimatedBottomNavBarState createState() =>
      _CustomAnimatedBottomNavBarState();
}

class _CustomAnimatedBottomNavBarState
    extends State<CustomAnimatedBottomNavBar> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
  ];

  final List<Widget> _pages = [
    Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search', style: TextStyle(fontSize: 24))),
    Center(child: Text('Favorites', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex], // Display the selected page
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildAnimatedNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedNavBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _icons.map((icon) {
          int index = _icons.indexOf(icon);
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
              padding: EdgeInsets.symmetric(horizontal: isSelected ? 16 : 8, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.deepPurple.shade50 : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: isSelected ? Colors.black : Colors.white,
                  ),
                  if (isSelected)
                    SizedBox(width: 8),
                  if (isSelected)
                    Text(
                      _getLabelForIndex(index),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Favorites';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }
}