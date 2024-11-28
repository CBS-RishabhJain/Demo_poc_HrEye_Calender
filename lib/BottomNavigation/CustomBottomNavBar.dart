import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   @override
//   _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       if(_selectedIndex==0)
//         {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("ApiLabels.0"),
//               duration: Duration(seconds: 2),
//             ),
//           );
//         }
//       if(_selectedIndex==1)
//       {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("ApiLabels.1"),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//       if(_selectedIndex==2)
//       {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text("ApiLabels.2"),
//             duration: Duration(seconds: 2),
//           ),
//         );
//       }
//
//     });
//     // Add functionality for navigation or actions based on the index
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Selected Index: $_selectedIndex',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print("Central button pressed");
//         },
//         child: Icon(
//           Icons.circle_notifications,
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.yellow,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0), // Circular button
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Fix it in the center
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         color: Colors.orange,
//         notchMargin: 8.0, // Space between FAB and BottomAppBar
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               _buildNavItem(Icons.home, 'Home', 0),
//               _buildNavItem(Icons.bar_chart, 'Market', 1),
//               SizedBox(width: 40), // Space for the central button
//               _buildNavItem(Icons.account_balance_wallet, 'Assets', 2),
//               _buildNavItem(Icons.menu, 'Menu', 3),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildNavItem(IconData icon, String label, int index) {
//     return InkWell(
//       onTap: () => _onItemTapped(index),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             size: 19.0,
//             color: _selectedIndex == index ? Colors.black : Colors.white,
//           ),
//           const SizedBox(height: 4), // Add spacing between icon and text
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 12, // Ensure text fits within the space
//               color: _selectedIndex == index ? Colors.black : Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Default selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Bottom Navigation"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          "Selected Page: $_selectedIndex",
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.list, title: 'List'),
          TabItem(icon: Icons.swap_horiz, title: 'Swap'),
          TabItem(icon: Icons.share, title: 'Share'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: _selectedIndex, // Default selected index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;

            if(_selectedIndex==0)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("ApiLabels.0"),
              duration: Duration(seconds: 1),
            ),
          );
        }
      if(_selectedIndex==1)
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("ApiLabels.1"),
            duration: Duration(seconds: 1),

          ),
        );
      }
      if(_selectedIndex==2)
      {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("ApiLabels.2"),
            duration: Duration(seconds: 1),
          ),
        );
      }
          });
        },
        curveSize: 90, // Adjust the curve size
        backgroundColor: Colors.red,
        activeColor: Colors.orange,
        color: Colors.white,
        elevation: 10,
        shadowColor: Colors.red,
      ),
    );
  }
}
