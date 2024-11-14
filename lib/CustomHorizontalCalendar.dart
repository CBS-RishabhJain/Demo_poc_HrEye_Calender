import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:intl/intl.dart'; // For formatting dates

class CustomHorizontalCalendar extends StatefulWidget {
  @override
  _CustomHorizontalCalendarState createState() => _CustomHorizontalCalendarState();
}

class _CustomHorizontalCalendarState extends State<CustomHorizontalCalendar> {
  final ItemScrollController itemScrollController = ItemScrollController();
  DateTime selectedMonth = DateTime.now();

  void _selectMonth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedMonth,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendar,
      selectableDayPredicate: (DateTime date) => date.day == 1,
    );
    if (picked != null && picked != selectedMonth) {
      setState(() {
        selectedMonth = picked;
      });
      // Scroll to the new month if needed
      itemScrollController.scrollTo(
        index: picked.difference(DateTime.now()).inDays,
        duration: Duration(seconds: 1),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Horizontal Calendar'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectMonth(context),
          ),
        ],
      ),
      body: Container(
        height: 100, // Adjust height as needed
        child: ScrollablePositionedList.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 365, // Number of days, adjust as needed
          itemBuilder: (context, index) {
            DateTime date = selectedMonth.add(Duration(days: index));
            bool isToday = date.day == DateTime.now().day &&
                date.month == DateTime.now().month &&
                date.year == DateTime.now().year;
            bool isSpecialDate = date.year == 2024 && date.month == 11 && date.day == 15 ;

            return GestureDetector(
              onTap: () {
                setState(() {
                  print('Selected date: $date');
                });
              },
              child: Container(
                width: 60, // Adjust width as needed
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: isToday
                      ? Colors.red
                      : isSpecialDate
                      ? Colors.green
                      : Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
