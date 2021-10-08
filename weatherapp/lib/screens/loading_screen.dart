import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setupWeather() async {
    Weather instance = Weather(city: 'Mumbai');
    await instance.setWeather();
    Navigator.pushReplacementNamed(context, '/weather', arguments: {
      'object': instance,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB8B8B8),
      body: Center(
        child: SpinKitWave(
          color: Color(0xFFDC334C),
          size: 100,
        ),
      ),
    );
  }
}
