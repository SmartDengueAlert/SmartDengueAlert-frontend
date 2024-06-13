import 'package:flutter/material.dart';
import 'package:smart_dengue/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static List<RequiredLocations> locations = [
    RequiredLocations('Angoda'),
    RequiredLocations('Rathmalana'),
    RequiredLocations('Hanwella'),
    RequiredLocations('Dehiwala'),
    RequiredLocations('Moratuwa'),
    RequiredLocations('Sri Jayawardenepura'),
    RequiredLocations('Colombo'),
  ];

  List<RequiredLocations> displayList = List.from(locations);

  void updateList(String value) {
    setState(() {
      displayList = locations
          .where((element) =>
              element.location!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Future<void> fetchWeatherAndNavigate(
      String location, BuildContext context) async {
    try {
      String weatherData = await fetchWeatherData(location);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Home(location: location, weatherData: weatherData),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/lotus_tower.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search Your Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: displayList.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => fetchWeatherAndNavigate(
                        displayList[index].location!, context),
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(10.0),
                      width: 360,
                      height: 75,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text(
                        displayList[index].location!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class RequiredLocations {
  final String? location;

  RequiredLocations(this.location);
}

Future<String> fetchWeatherData(String location) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/weather'), // Update the endpoint
    body: json.encode({'location': location}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data.toString(); // Update this based on your response structure
  } else {
    throw Exception('Failed to fetch weather data');
  }
}
