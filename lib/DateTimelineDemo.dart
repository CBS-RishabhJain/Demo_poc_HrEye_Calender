import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class DateTimeLineDemo extends StatelessWidget {
  const DateTimeLineDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTime Line Demo'),
      ),
      body: EasyDateTimeLine(
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          // Handle date change here.
          print('Selected date: $selectedDate');

          // Check if the selected date is a weekend
          if (selectedDate.weekday == DateTime.saturday || selectedDate.weekday == DateTime.sunday) {
            print("Weekend selected!");
            // You can perform additional logic here, like changing styles or showing a message
          }
        },
        headerProps: const EasyHeaderProps(
          monthPickerType: MonthPickerType.switcher,
          dateFormatter: DateFormatter.fullDateDMY(),
        ),
        dayProps: EasyDayProps(
          dayStructure: DayStructure.dayStrDayNumMonth,
          activeDayStyle: DayStyle(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color(0xFFFF3369),
            ),
          ),
          // Custom style for inactive days
          inactiveDayStyle: DayStyle(
            decoration: BoxDecoration(
              color: Color(0xFFFFF833), // Default color for inactive days
            ),
          ),
        ),
      ),
    );
  }
}