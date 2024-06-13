import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String location;
  final String weatherData;

  Home({required this.location, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi User'),
        backgroundColor: Colors.green,
      ),
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
            child: Text(
              weatherData,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]),
    );
  }
}
