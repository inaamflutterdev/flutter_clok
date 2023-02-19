import 'package:flutter/material.dart';
import 'package:flutter_clok/clock_view.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Text(
              'Clock',
              style: TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: const TextStyle(
                    fontFamily: 'avenir',
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Align(
                  alignment: Alignment.center,
                  child: ClockView(
                    size: MediaQuery.of(context).size.height / 4,
                  ))),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Timezone',
                  style: TextStyle(
                    fontFamily: 'avenir',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      'UTC' + offsetSign + timezoneString,
                      style: const TextStyle(
                        fontFamily: 'avenir',
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
