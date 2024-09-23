import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = 'Loading...';
  String _userName = 'User';
  String _location = '';
  double _predictionValue = 0.0;
  String _warningLevel = 'No danger';
  String _weatherInfo = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    fetchData();
    loadUserProfile();
    _startAutoRefresh(); // Start the auto-refresh timer
  }

  Future<void> loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? 'User';
    final location = prefs.getString('location') ?? '';
    setState(() {
      _userName = name;
      _location = location;
      fetchPrediction(location); // Fetch prediction based on location
      fetchWeather(location); // Fetch weather data based on location
    });
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:3000/api/data'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _message = data['message'];
        });
      } else {
        setState(() {
          _message = 'Failed to load data';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Error: $e';
      });
    }
  }

  // Fetch prediction from the backend
  Future<void> fetchPrediction(String location) async {
    if (location.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse('http://localhost.1:3000/predictions/getPrediction?location=$location'),
        );
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final prediction = data['prediction']['Dengue Prediction'];
          setState(() {
            _predictionValue = prediction;
            _updateWarningLevel();
          });
        } else {
          setState(() {
            _warningLevel = 'Failed to get prediction';
          });
        }
      } catch (e) {
        setState(() {
          _warningLevel = 'Error: $e';
        });
      }
    } else {
      setState(() {
        _warningLevel = 'No location selected';
      });
    }
  }

  // Update the warning level based on the prediction value
  void _updateWarningLevel() {
    if (_predictionValue > 20) {
      _warningLevel = 'Danger';
    } else if (_predictionValue >= 10) {
      _warningLevel = 'Mid Danger';
    } else {
      _warningLevel = 'No Danger';
    }
  }

  Future<void> fetchWeather(String location) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/weather/fetch-current'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'location': location}),
      );

      if (response.statusCode == 200) {
        final weatherData = jsonDecode(response.body)['data']; // Accessing the 'data' field

        setState(() {
          _weatherInfo =
              'Temperature: ${weatherData['temperature']} °C\n'
              'Humidity: ${weatherData['humidity']} %\n'
              'Rainfall: ${weatherData['rainfall']} mm\n'
              'Weather: ${weatherData['weatherDescription']}\n'
              'Wind Speed: ${weatherData['windSpeed']} m/s';
        });
      } else {
        print('Error fetching weather data: ${response.statusCode}'); // Log error
        setState(() {
          _weatherInfo = 'Error fetching weather data: ${response.statusCode}';
        });
      }
    } catch (e) {
      print('Exception in fetchWeather: $e'); // Log exception
      setState(() {
        _weatherInfo = 'Exception in fetchWeather: $e';
      });
    }
  }

  // Refresh every 3 hours
  void _startAutoRefresh() {
    _timer = Timer.periodic(const Duration(hours: 3), (Timer timer) {
      fetchPrediction(_location); // Fetch prediction automatically
      fetchWeather(_location); // Fetch weather data automatically
    });
  }

  // Manually refresh warnings and weather
  void _refreshWarnings() {
    fetchPrediction(_location); // Manually fetch prediction
    fetchWeather(_location); // Manually fetch weather
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $_userName'),
        backgroundColor: const Color.fromARGB(255, 20, 207, 142),
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
              padding: const EdgeInsets.all(10.0),
              width: 360,
              height: 400,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: SingleChildScrollView( // Wrap Column in SingleChildScrollView
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Warnings for $_location',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _warningLevel,
                      style: TextStyle(
                        fontSize: 25,
                        color: _warningLevel == 'Danger'
                            ? Colors.red
                            : (_warningLevel == 'Mid Danger' ? Colors.orange : Colors.green),
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _refreshWarnings,
                      child: const Text(
                        'Refresh Warnings',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 20, 207, 142),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Weather Data Box
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Current Weather:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _weatherInfo.isEmpty ? 'No weather data available' : _weatherInfo,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
