// auth_service.dart

import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  // Check if the user is logged in
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print("Is logged in 1 : $isLoggedIn");
    return isLoggedIn;
  }


  // Perform login
  Future<bool> login() async {
    // In a real application, this method would perform actual authentication.
    // For simplicity, we'll just simulate a login by setting a flag in SharedPreferences.

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    return true; // Return true to indicate successful login
  }

  // Perform logout
  // Future<void> logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('isLoggedIn', false);
  // }
}
