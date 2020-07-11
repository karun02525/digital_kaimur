import 'package:flutter/material.dart';
import 'package:mini_calendar/mini_calendar.dart';
//https://github.com/OpenFlutter/mini_calendar

class MiniCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Container(
        child: MonthWidget(),
    ));
  }
}
