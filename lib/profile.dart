import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dengue/locations.dart';
import 'package:smart_dengue/nav.dart';
import 'package:smart_dengue/prediction.dart';
import '../widgets/custom_scaffold.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String selectedLocation = '';

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
    emailController.dispose();
    super.dispose();
  }

  Future<void> loadProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Load name, location, and email from SharedPreferences
      final name = prefs.getString('name') ?? '';
      final location = prefs.getString('location') ?? '';
      final email = prefs.getString('email') ?? '';

      // Update the text controllers with the loaded values
      setState(() {
        nameController.text = name;
        selectedLocation = location;
        locationController.text = location;
        emailController.text = email;
      });
    } catch (e) {
      // Handle errors loading profile data
      print('Error loading profile: $e');
    }
  }

  Future<void> saveProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      // Save name, location, and email to SharedPreferences
      await prefs.setString('name', nameController.text);
      await prefs.setString('location', locationController.text);
      await prefs.setString('email', emailController.text);

      // Get the location from the controller and fetch the prediction
      final location = locationController.text;
      final prediction = await getPrediction(location);

      // Save the prediction to SharedPreferences
      await prefs.setString('prediction', prediction);

      print('Profile saved with prediction: $prediction');
    } catch (e) {
      // Handle errors saving profile data
      print('Error saving profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background color of the Scaffold to transparent
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: const Color.fromARGB(255, 20, 207, 142).withOpacity(0.9),
      ),
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/homescreen.jpeg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(1), // Background color with opacity for form area
                    borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Shadow offset
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 20.0),
                        CircleAvatar(
                          radius: 50,
                          child: const Icon(
                            Icons.person,
                            size: 72,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                        ),
                        const SizedBox(height: 20.0),
                        DropdownButtonFormField<String>(
                          value:
                          selectedLocation.isNotEmpty ? selectedLocation : null,
                          decoration: const InputDecoration(
                            labelText: 'Location',
                            prefixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(),
                          ),
                          items: locations.map((location) {
                            return DropdownMenuItem<String>(
                              value: location.location,
                              child: Text(location.location!),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLocation = value!;
                              locationController.text = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20.0),
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
                          child: const Text('Save Profile'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
