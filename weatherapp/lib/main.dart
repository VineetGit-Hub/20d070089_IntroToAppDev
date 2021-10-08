import 'package:flutter/material.dart';
import 'package:weatherapp/screens/weather_screen.dart';
import 'package:weatherapp/screens/loading_screen.dart';
import 'package:weatherapp/screens/searching_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingScreen(),
      '/weather': (context) => WeatherScreen(),
      '/search': (context) => SearchingScreen(),
    },
  ));
}
