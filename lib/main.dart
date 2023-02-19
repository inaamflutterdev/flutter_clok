import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'enums.dart';
import 'homepage.dart';
import 'menu_info.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var initializationSettingsAndroid =
  //     const AndroidInitializationSettings('mipmap/ic_launcher');
  // var initializationSettingsIOS = IOSInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //     onDidReceiveLocalNotification: (int id, title, body, payload) async {});
  // var initializationSettings = InitializationSettings(
  //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (payload) async {
  //   if (payload != null) {
  //     debugPrint('notification payload: $payload');
  //   } // big pirablems
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) =>
            MenuInfo(MenuType.clock, imageSource: '', title: ''),
        child: const HomePage(),
      ),
    );
  }
}
