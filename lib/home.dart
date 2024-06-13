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
  // removeToken()async{
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  // }
  // // final String location;
  // // final String weatherData;
  // // Home({required this.location, required this.weatherData});



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

  // // Function to sign out
  // Future<void> signOut() async {
  //   // Remove token
  //   await removeToken();
  //   // Navigate to login page
  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi User'),
        backgroundColor: Colors.green,
      ),
      // drawer: MyDrawer(
      //   onProfileTap: goToProfilePage, 
      //   onSignOut: signOut,
      // ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/lotus_tower.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 15,
          right: 15,
          child: Container(
            padding: EdgeInsets.all(10.0),
            width: 360,
            height: 400,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25.0),
            ),
            // child: Text(
            //   weatherData,
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
          ),
        ),
      ]),
    );
  }
}


// Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Color.fromARGB(255, 149, 233, 203),
//       appBar: AppBar(
//         title:const Text("Home"),
//         backgroundColor: Color.fromARGB(255, 20, 207, 142),
//         // actions:[

//         // ]
//       ),
//       drawer: MyDrawer(
//         onProfileTap: goToProfilePage, 
//         onSignOut: signOut,
//       ),
//       body: const SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Text(
//               //   'Home Screen',
//               //   style: TextStyle(
//               //     fontWeight: FontWeight.w500,
//               //     fontSize: 18,
//               //     fontFamily: 'Poppins',
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 15,
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
