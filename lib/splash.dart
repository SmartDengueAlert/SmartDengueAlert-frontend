import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dengue/home.dart'; // Import the home page
import 'package:smart_dengue/login.dart'; // Import the login page

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
          builder: (context) => token == null ? LoginPage() : MyHomePage(),
        ),
      );
    });
  }).catchError((error) {
    // Handle error if token retrieval fails
    print("Error retrieving token: $error");
    // Navigate to login page or handle the error appropriately
  });
}


  // @override
  // void initState() {
  //   super.initState();
  //   print("Initializing Splash state...");
  //   _navigate();
  // }

  // _navigate() async {
  //   // Delay for a few seconds to simulate a splash screen
  //   await Future.delayed(const Duration(seconds: 5));

  //   // Check if the user is logged in
  //   bool isLoggedIn = await AuthService().isLoggedIn();
  //   print("Is logged in: $isLoggedIn");

  //   // Navigate to the appropriate screen
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       //builder: (context) => isLoggedIn ? const MyHomePage(title: 'Home') : LoginPage(),
  //       builder: (context) => LoginPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: 
      Column(
        children: [
          Flexible(
            child: Container(
              
            ),
          ),
        ],
      ),
      
    );
  }
}
