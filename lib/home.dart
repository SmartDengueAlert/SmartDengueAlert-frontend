import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dengue/drawer.dart';
import 'package:smart_dengue/login.dart';
import 'package:smart_dengue/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  removeToken()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  //navigate to profile page
  void goToProfilePage(){
    //pop menu drawer
    Navigator.pop(context);

    //go to profile page
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ProfilePage(),
      ),
    );
  }

  // Function to sign out
  Future<void> signOut() async {
    // Remove token
    await removeToken();
    // Navigate to login page
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 149, 233, 203),
      appBar: AppBar(
        title:const Text("Home"),
        backgroundColor: Color.fromARGB(255, 20, 207, 142),
        // actions:[

        // ]
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage, 
        onSignOut: signOut,
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Home Screen',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w500,
              //     fontSize: 18,
              //     fontFamily: 'Poppins',
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
