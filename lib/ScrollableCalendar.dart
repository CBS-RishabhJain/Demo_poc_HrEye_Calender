import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScrollableCalendar extends StatefulWidget {
  @override
  _ScrollableCalendarState createState() => _ScrollableCalendarState();
}

class _ScrollableCalendarState extends State<ScrollableCalendar> {
  DateTime currentDate = DateTime.now();
  final PageController _pageController = PageController(initialPage: DateTime
      .now()
      .month - 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scrollable Calendar'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildMonthYearHeader(),
          _buildWeekdayLabels(),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentDate = DateTime(currentDate.year, index + 1);
                });
              },
              itemBuilder: (context, index) {
                DateTime displayedMonth = DateTime(currentDate.year, index + 1);
                return _buildMonthView(displayedMonth);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthYearHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        DateFormat.yMMMM().format(currentDate),
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildWeekdayLabels() {
    List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: weekdays
            .map(
              (day) =>
              Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildMonthView(DateTime date) {
    List<Widget> days = [];
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    DateTime lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    int weekDayOffset = (firstDayOfMonth.weekday + 6) %
        7; // Adjust to make Monday the first day
    DateTime today = DateTime.now();

    // Add empty slots for days before the first day of the month
    for (int i = 0; i < weekDayOffset; i++) {
      days.add(Container());
    }

    // Add actual days of the month
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      DateTime currentDay = DateTime(date.year, date.month, day);
      bool isToday = currentDay.day == today.day &&
          currentDay.month == today.month &&
          currentDay.year == today.year;

      days.add(
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(
                  'Selected: ${DateFormat.yMd().format(currentDay)}')),
            );
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isToday ? Colors.yellow : Colors.blueAccent.withOpacity(
                  0.2),
            ),
            child: Text(
              day.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isToday ? Colors.black : Colors.black87,
              ),
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: days,
      ),
    );
  }
}