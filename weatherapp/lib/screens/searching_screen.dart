import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';

class SearchingScreen extends StatefulWidget {
  const SearchingScreen({Key? key}) : super(key: key);

  @override
  _SearchingScreenState createState() => _SearchingScreenState();
}

class _SearchingScreenState extends State<SearchingScreen> {

  void updateWeather(String city) async {
    Weather instance = Weather(city: city);
    await instance.setWeather();
    if (instance.type == null)
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('City Not Found!', textScaleFactor: 1.5,),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    else
      Navigator.pop(context, {
        'object': instance,
      });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF012842),
        elevation: 20,
        title: const Text('Search City', textScaleFactor: 1.3,),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.5, 0.5),
            radius: 1.5,
            colors: <Color>[
              Color(0xFF2CB7D0),
              Color(0xFF3A7CCD),
              Color(0xFF6E49D4),
              Color(0xFFB22AFC),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100,),
              TextField(
                onSubmitted: (String citySearched) {
                  updateWeather(citySearched);
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFEBE4F1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  labelText: 'City Name'
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Color(0xFF2354B6), fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
