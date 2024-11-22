import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';



class BarChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bar Chart with Touch Interactions")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(toY: 8, color: Colors.blue),
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(toY: 6, color: Colors.green),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(toY: 10, color: Colors.orange),
                ],
              ),
            ],
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(show: true),
            gridData: FlGridData(show: false),

            // Enabling touch interactions
            barTouchData: BarTouchData(
              touchTooltipData: BarTouchTooltipData(
               // tooltipBgColor: Colors.blueAccent, // Tooltip background color
              ),
             // touchResponse: BarTouchResponse(
               // touchPositionIndicatorBuilder: (BarTouchResponse touchResponse) {
               //   return BarTouchPositionIndicator(touchResponse, Colors.red);
                //},
              ),
              // Enables showing tooltips when bars are tapped
        //      handleBuiltInTouches: true,
            ),
          ),
        ),
    //  ),
    );
  }
}




