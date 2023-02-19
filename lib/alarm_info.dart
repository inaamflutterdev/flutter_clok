import 'package:flutter/cupertino.dart';

class AlarmInfo {
  DateTime alarmDateTime;
  String description;
  late bool isActive;
  List<Color> gradientColors;

  AlarmInfo(this.alarmDateTime,
      {required this.description, required this.gradientColors});
}
