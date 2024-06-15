import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
// import 'package:smart_dengue/home.dart';
// import 'package:smart_dengue/login.dart';
// import 'package:smart_dengue/utils/auth_service.dart';
import 'splash.dart';

void main() {
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
