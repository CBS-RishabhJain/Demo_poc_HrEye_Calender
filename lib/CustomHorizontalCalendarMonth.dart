import 'package:flutter/material.dart';

class CustomHorizontalCalendarMonth extends StatefulWidget {
  @override
  _CustomHorizontalCalendarState createState() => _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendarMonth> {
  int selectedIndex = -1; // -1 means no month is selected initially

  @override
  Widget build(BuildContext context) {
    List<String> months = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Horizontal Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100, // Adjust the height as per your needs
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: months.length,
            itemBuilder: (context, index) {
              bool isSelected = index == selectedIndex; // Check if the month is selected
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // Update the selected month index
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.red : Colors.green, // Change color based on selection
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      months[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

