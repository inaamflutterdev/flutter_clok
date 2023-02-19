// ignore_for_file: deprecated_member_use

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clok/data.dart';
import 'package:flutter_clok/theme.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarm',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                // ignore: unused_local_variable
                var alarmTime =
                    DateFormat('hh:mm aa').format(alarm.alarmDateTime);
                return Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: alarm.gradientColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: alarm.gradientColors.last.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 4,
                        offset: const Offset(4, 4),
                      ),
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Office',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                ),
                              ),
                            ],
                          ),
                          Switch(
                            onChanged: (bool value) {},
                            value: true,
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      const Text(
                        'Mon-Fri',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '07:00 AM',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'avenir',
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 36,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 2,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  dashPattern: const [5, 4],
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    // child: FlatButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    // onPressed: () {},
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/add_alarm.png',
                          scale: 1.5,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Add Alarm',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'avenir',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ),
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FlatButton {}
