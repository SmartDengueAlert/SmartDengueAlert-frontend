// splash.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dengue/home.dart'; // Import the home page
import 'package:smart_dengue/login.dart'; // Import the login page
import 'package:smart_dengue/nav.dart';
//import 'package:smart_dengue/utils/auth_service.dart'; // Import authentication service

import 'widgets/custom_scaffold.dart';

class Splash extends StatefulWidget {
  Splash({Key? key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //var token;
  late String? token;
  
  Future<void> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }
  // getToken()async{
  //   final prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token');
  // }
  @override
void initState() {
  super.initState();
  print("Initializing Splash state...");
  getToken().then((_) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => token == null ? LoginPage() : nav(),
        ),
      );
    });
  }).catchError((error) {
    // Handle error if token retrieval fails
    print("Error retrieving token: $error");
    // Navigate to login page or handle the error appropriately
  });
}


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Center(
        child: CircularProgressIndicator(), // Show loading indicator while retrieving token
      ),
    );
  }
}
