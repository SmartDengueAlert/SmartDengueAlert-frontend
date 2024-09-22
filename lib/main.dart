import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_dengue/info_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_dengue/home.dart';
// import 'package:smart_dengue/login.dart';
// import 'package:smart_dengue/utils/auth_service.dart';
//import 'package:workmanager/workmanager.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'splash.dart';

const taskName = "fetchWarningsTask";

Future<void> main() async {
 /* WidgetsFlutterBinding.ensureInitialized();

  // Initialize WorkManager to fetch warnings periodically
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  // Schedule background task every 3 hours
  await Workmanager().registerPeriodicTask(
    "1",
    taskName,
    frequency: const Duration(hours: 3),
  );*/

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
//
// // Callback function for WorkManager
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     final prefs = await SharedPreferences.getInstance();
//     final location = prefs.getString('location') ?? 'YourDefaultLocation';
//
//     final response = await http.post(
//       Uri.parse('http://localhost:3000/predictions/getPrediction?location=$location'),
//     );
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final prediction = data['prediction']['Dengue Prediction'];
//
//       String warningLevel;
//       if (prediction > 20) {
//         warningLevel = 'Danger';
//       } else if (prediction >= 10) {
//         warningLevel = 'Mid Danger';
//       } else {
//         warningLevel = 'No Danger';
//       }
//
//       // Set up local notifications
//       FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//       const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');
//       final InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);
//
//       await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//       const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//         'your_channel_id',
//         'your_channel_name',
//         channelDescription: 'your_channel_description',
//         importance: Importance.max,
//         priority: Priority.high,
//       );
//       const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//
//       await flutterLocalNotificationsPlugin.show(
//         0,
//         'Dengue Prediction Alert',
//         'Current warning level: $warningLevel',
//         platformChannelSpecifics,
//       );
//     }
//
//     return Future.value(true);
//   });
// }