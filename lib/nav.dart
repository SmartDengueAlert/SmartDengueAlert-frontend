import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dengue/drawer.dart';
import 'package:smart_dengue/home.dart';
import 'package:smart_dengue/home_page.dart';
import 'package:smart_dengue/info_page.dart';
import 'package:smart_dengue/login.dart';
import 'package:smart_dengue/profile.dart';
import 'package:smart_dengue/search_page.dart';


class nav extends StatefulWidget {
  @override
  _navState createState() => _navState();
}

class _navState extends State<nav> {
  removeToken()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    // Home(
    //   location: '',
    //   weatherData: '',
    // ),
    MyHomePage(),
    Search(),
    InfoPage(),
    ProfilePage(),
  ];

  // void goToHomePage(){
  //   //go to home page
  //   Navigator.push(
  //     context, 
  //     MaterialPageRoute(
  //       builder: (context) => MyHomePage(),
  //     ),
  //   );
  // }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle sign out when "Logout" is tapped
    if (index == 4) {
      index=0;
      _selectedIndex = index;
      //goToHomePage();
      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("LogOut"),
            content: Text("Are you sure you want to logout?"),
            actions: <Widget>[
              TextButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  
                },
              ),
              TextButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  logout(); // Call signOut() function
                },
              ),
            ],
          );
        },
      );
    }
  }

  // //navigate to profile page
  // void goToProfilePage(){
  //   //pop menu drawer
  //   Navigator.pop(context);

  //   //go to profile page
  //   Navigator.push(
  //     context, 
  //     MaterialPageRoute(
  //       builder: (context) => ProfilePage(),
  //     ),
  //   );
  // }

  // Function to sign out
  Future<void> logout() async {
    // Remove token
    await removeToken();
    // Navigate to login page
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MyDrawer(
      //   //onProfileTap: goToProfilePage, 
      //   onSignOut: signOut,
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'LogOut',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
