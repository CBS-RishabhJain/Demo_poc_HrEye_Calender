import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PricePoint {
  final double x;
  final double y;

  PricePoint(this.x, this.y);
}

// class LineChartExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Line Chart with Tooltip')),
//       body: Center(
//         child: LineChartWidget(
//           points: [
//             PricePoint(1, 100),
//             PricePoint(2, 150),
//             PricePoint(3, 120),
//             PricePoint(4, 180),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LineChartWidget extends StatefulWidget {
  final List<PricePoint> points;

  const LineChartWidget({Key? key, required this.points}) : super(key: key);

  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  late int showingTooltipSpot;

  @override
  void initState() {
    showingTooltipSpot = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: widget.points
                .map((point) => FlSpot(point.x, point.y))
                .toList(),
            isCurved: false,
            color: Colors.orange,
            dotData: FlDotData(show: false),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
           // getTooltipColor: Colors.blue,
            //tooltipBgColor: Colors.blue, // Tooltip background color
            getTooltipColor: (spot) {
              // Dynamically return a color based on the y-value
              if (spot.y > 150) {
                return Colors.green; // For high values
              } else if (spot.y > 100) {
                return Colors.green; // For medium values
              } else {
                return Colors.red; // For low values
              }
            },
            tooltipRoundedRadius: 3.0,
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((spot) {
                return LineTooltipItem(
                  '${spot.y.toStringAsFixed(2)}',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList();
            },
          ),
          touchCallback: (event, response) {
            if (response?.lineBarSpots != null) {
              setState(() {
                final spotIndex = response!.lineBarSpots![0].spotIndex;
                showingTooltipSpot = (spotIndex == showingTooltipSpot) ? -1 : spotIndex;
              });
            }
          },
        ),
      ),
    );
  }
}

