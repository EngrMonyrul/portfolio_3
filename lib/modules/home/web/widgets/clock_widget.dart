import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({super.key});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return AnalogClock(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      isLive: true,
      hourHandColor: Colors.green,
      minuteHandColor: Colors.orange,
    );
  }
}
