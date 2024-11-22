import 'package:demoprojectcalender/HorizontalStepper.dart';
import 'package:flutter/material.dart';

import 'BarChartExample.dart';
import 'CalendarApp.dart';
import 'CustomHorizontalCalendar.dart';
import 'CustomHorizontalCalendarMonth.dart';
import 'CustomStepperExample.dart';
import 'DateTimelineDemo.dart';
import 'FLchart.dart';
import 'HorizontalStepperPage.dart';
import 'ScrollableCalendar.dart';
import 'ScrollableCleanCalendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarChartExample(),
    );
  }

}

