import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dengue/home.dart'; // Import the home page
import 'package:smart_dengue/nav.dart';
import '../theme/theme.dart';
import '../widgets/custom_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load profile information when the page is initialized
    loadProfile();
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    super.dispose();
  }

  Future<void> loadProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Load name and location from SharedPreferences
      final name = prefs.getString('name') ?? '';
      final location = prefs.getString('location') ?? '';
      // Update the text controllers with the loaded values
      setState(() {
        nameController.text = name;
        locationController.text = location;
      });
    } catch (e) {
      // Handle errors loading profile data
      print('Error loading profile: $e');
    }
  }

  Future<void> saveProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Save name and location to SharedPreferences
      await prefs.setString('name', nameController.text);
      await prefs.setString('location', locationController.text);
    } catch (e) {
      // Handle errors saving profile data
      print('Error saving profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 149, 233, 203),
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: Color.fromARGB(255, 20, 207, 142),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Icon(
                          Icons.person,
                          size: 72,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                            labelText: 'Location',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Save profile information before navigating to home page
                            saveProfile().then((_) {
                              // Navigate to home page after saving profile
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => nav(),
                                ),
                              );
                            });
                          },
                          child: Text('Save Profile'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
