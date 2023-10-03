import 'package:flutter/material.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1999, 11, 2),
      lastDate: DateTime(2100, 11, 2),
      initialCalendarMode: DatePickerMode.day,
      onDateChanged: (_) {},
    );
  }
}
