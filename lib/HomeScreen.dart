import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Layout"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // A header section with dynamic height
              Container(
                height: screenHeight * 0.2, // 20% of screen height
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text(
                  "Header",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16), // Add spacing

              // A scrollable section with dynamic width
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: List.generate(10, (index) {
                  return Container(
                    width: screenWidth * 0.4, // 40% of screen width
                    height: screenWidth * 0.4, // Keep it square
                    color: Colors.greenAccent,
                    alignment: Alignment.center,
                    child: Text(
                      "Box ${index + 1}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 16), // Add spacing

              // A footer section
              Container(
                height: screenHeight * 0.1, // 10% of screen height
                color: Colors.orange,
                alignment: Alignment.center,
                child: Text(
                  "Footer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}