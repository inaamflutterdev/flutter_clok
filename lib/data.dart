// ignore: unused_element
import 'package:flutter_clok/alarm_info.dart';
import 'package:flutter_clok/enums.dart';
import 'package:flutter_clok/menu_info.dart';
import 'package:flutter_clok/theme.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
      description: 'Office', gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(const Duration(hours: 2)),
      description: 'Sport', gradientColors: GradientColors.sunset),
];
