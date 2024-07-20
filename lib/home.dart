import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dengue/locations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = 'Loading...'; // Initial message state
  String _userName = 'User'; // Initial user name state
  String _location = ''; // Initial location state
  List<String> _warnings = []; // List to store warnings

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget initializes
    loadUserProfile(); // Load user name and location from SharedPreferences
  }

  Future<void> loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? 'User';
    final location = prefs.getString('location') ?? '';
    setState(() {
      _userName = name;
      _location = location;
      // fetchWarnings(location); // Commenting out the backend call for now
      // Placeholder warning message
      _warnings = location.isNotEmpty
          ? ['No warnings for $location']
          : [];
    });
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http:/localhost:3000/api/data')); // Replace with the API endpoint //use pc ipv4 address as localhost
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _message = data['message']; // Update message state with API response
        });
      } else {
        setState(() {
          _message = 'Failed to load data'; // Handle error case
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Error: $e'; // Handle network or other errors
      });
    }
  }

  // Commenting out the backend call for now
  // Future<void> fetchWarnings(String location) async {
  //   if (location.isNotEmpty) {
  //     try {
  //       final response = await http.get(Uri.parse('http://localhost:3000/api/warnings?location=$location')); // Replace with the actual endpoint  //use pc ipv4 address as localhost
  //       if (response.statusCode == 200) {
  //         final data = json.decode(response.body);
  //         final warnings = List<String>.from(data['warnings']);
  //         setState(() {
  //           _warnings = warnings.isNotEmpty ? warnings : ['There are no warnings for $location'];
  //         });
  //       } else {
  //         setState(() {
  //           _warnings = ['Failed to load warnings for $location'];
  //         });
  //       }
  //     } catch (e) {
  //       setState(() {
  //         _warnings = ['Error: $e'];
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _warnings = [];
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $_userName'),
        backgroundColor: Color.fromARGB(255, 20, 207, 142),
      ),
      body: Stack(
        children: [
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Warnings for $_location',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_warnings.isEmpty)
                    Text(
                      'No location selected',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    )
                  else
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _warnings.map((warning) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          warning,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )).toList(),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
