import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:smart_dengue/home.dart';
import 'package:smart_dengue/profile.dart';
import '../theme/theme.dart';
import '../widgets/custom_scaffold.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String token = 'uTmDgwpXglJWEWTz7m0VBzniYfkQqw9M';//THIS IS A STATIC TOKEN FOR NOW     //USE THE DYNAMIC TOKEN FROM THE API OR OTHER BACKEND SEVICE TOKEN!!!
  
  // Future<void> loginUser(String username, String location) async {
  //   final response = await http.post(
  //     Uri.parse('http://localhost:5000/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'username': username,
  //       'location': location,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     print('Logged in successfully');
  //     // If login is successful, navigate to the home page
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => ProfilePage(), // Replace ProfilePage with your home page
  //       ),
  //     );
  //   } else {
  //     print('Failed to login');
  //     // Show an error message to the user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Failed to login'),
  //       ),
  //     );
  //   }
  // }
  
  StoretheToken(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);
      await prefs.setString('token', token);
      // Optionally, you can log a message indicating successful storage
      print('Token stored successfully: $token');
    } catch (e) {
      // Handle any errors that occur during storage
      print('Error storing token: $e');
      // You can also throw the error to propagate it further if needed
      throw e;
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
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
                // get started form
                child: Form(
                  key: _formLoginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // get started text
                      const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      // full name
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter Full name';
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     label: const Text('Full Name'),
                      //     hintText: 'Enter Full Name',
                      //     hintStyle: const TextStyle(
                      //       color: Colors.black26,
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         color: Colors.black12, // Default border color
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         color: Colors.black12, // Default border color
                      //       ),
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // email
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // password
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12, // Default border color
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // i agree to the processing
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'I agree to the processing of ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          const Text(
                            'Personal data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      //signup button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formLoginKey.currentState!.validate() && agreePersonalData) {
                              // If the form is valid and the user has agreed to the terms
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Processing Data'),
                                ),
                              );

                              // Store the token and navigate to the home page
                              StoretheToken(email.text, password.text).then((_) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(),
                                  ),
                                );
                              });
                            } else {
                              // If the form is not valid or the user hasn't agreed to the terms
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    agreePersonalData? 'Please fill out all fields': 'Please agree to the processing of personal data',
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                          ),
                          child: Text('Sign up'),
                        ),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),

                      // sign up divider
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      // sign up social media logo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Logo(Logos.facebook_f),
                          Logo(Logos.twitter),
                          Logo(Logos.google),
                          Logo(Logos.apple),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // already have an account
                      // const Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       'Already have an account? ',
                      //       style: TextStyle(
                      //         color: Colors.black45,
                      //       ),
                      //     ),
                      //     // GestureDetector(
                      //     //   onTap: () {
                      //     //     Navigator.push(
                      //     //       context,
                      //     //       MaterialPageRoute(
                      //     //         builder: (e) => const SignInScreen(),
                      //     //       ),
                      //     //     );
                      //     //   },
                      //     //   child: Text(
                      //     //     'Sign in',
                      //     //     style: TextStyle(
                      //     //       fontWeight: FontWeight.bold,
                      //     //       color: lightColorScheme.primary,
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
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














































// import 'package:flutter/material.dart';
// import 'package:smart_dengue/utils/auth_service.dart'; // Import authentication service
// import 'package:smart_dengue/home.dart'; // Import the home page

// class LoginPage extends StatelessWidget {
//   const LoginPage({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         // Customize the app bar color and text style here
//         backgroundColor: Colors.blue, // Example color
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Add your logo or image here
//             // Example: Image.asset('assets/logo.png', height: 100),
//             ElevatedButton(
//               onPressed: () async {
//                 // Perform login
//                 bool isLoggedIn = await AuthService().login();
//                 if (isLoggedIn) {
//                   print("Is logged in 3: $isLoggedIn");
//                   // If login is successful, navigate to the home page
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const MyHomePage(title: 'GFG')),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 //primary: Colors.blue, // Button background color
//                 //onPrimary: Colors.white, // Text color
//                 textStyle: const TextStyle(fontSize: 18), // Text style
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8), // Button border radius
//                 ),
//               ),
//               child: const Text('Login'),
//             ),
//             // Add other widgets (e.g., text fields, forgot password link) here
//           ],
//         ),
//       ),
//     );
//   }
// }
