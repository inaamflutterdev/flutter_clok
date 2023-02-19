// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_clok/alarm_page.dart';
import 'package:flutter_clok/clock_page.dart';
import 'package:flutter_clok/enums.dart';
import 'package:flutter_clok/menu_info.dart';
import 'package:provider/provider.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    // ignore: unused_local_variable
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      backgroundColor: const Color(0xFF2D2f41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, child) {
              if (value.menuType == MenuType.clock) {
                return const ClockPage();
              } else if (value.menuType == MenuType.alarm) {
                return const AlarmPage();
              }
              return RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 20),
                  children: <TextSpan>[
                    const TextSpan(text: 'Upcoming \n'),
                    TextSpan(
                      text: value.title,
                      style: const TextStyle(fontSize: 45),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

Widget buildMenuButton(MenuInfo currentMenuInfo) {
  return Consumer<MenuInfo>(
    builder: (BuildContext context, MenuInfo value, child) {
      return TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
          primary: currentMenuInfo.menuType == value.menuType
              ? Colors.blue
              : Colors.transparent,
        ),
        onPressed: () async {
          var menuInfo = Provider.of<MenuInfo>(context, listen: false);
          await menuInfo.updateMenu(currentMenuInfo);
        },
        child: Column(
          children: <Widget>[
            Image.asset(
              currentMenuInfo.imageSource,
              scale: 1.6,
            ),
            const SizedBox(height: 15),
            Text(
              currentMenuInfo.title,
              style: const TextStyle(
                  fontFamily: 'avenir', color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      );
    },
  );
}
