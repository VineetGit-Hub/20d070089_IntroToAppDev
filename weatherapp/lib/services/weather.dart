import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  String city;
  String? type;
  String? description;
  String? icon;
  Map<String, dynamic>? main;
  num? visibility;
  Map<String, dynamic>? wind;
  int? cloudy;
  String? bgImgUrl;

  Weather({ required this.city });

  Future<void> setWeather() async {
    Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f2798be08e3bc2a03cfe69ec9a13979c'));
    Map data = jsonDecode(response.body);
    print(data);
    if (data['cod'] != '404') {
      type = data['weather'][0]['main'];
      description = data['weather'][0]['description'];
      icon = data['weather'][0]['icon'];
      main = data['main'];
      visibility = data['visibility'];
      wind = data['wind'];
      cloudy = data['clouds']['all'];
      switch(data['weather'][0]['id'] ~/ 100) {
        case 2:
          bgImgUrl = 'https://wallpaperbat.com/img/565649-download-into-the-storm-wallpaper-by-jayking4950-6a-now-browse-millions-of-popular-st-storm-wallpaper-weather-wallpaper-night-sky-wallpaper.jpg';
          break;
        case 3:
          bgImgUrl = 'https://i.pinimg.com/originals/23/89/24/23892493155b9c1e58f0a9f23edd993c.jpg';
          break;
        case 5:
          bgImgUrl = 'https://images.unsplash.com/photo-1515694346937-94d85e41e6f0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFpbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80';
          break;
        case 6:
          bgImgUrl = 'https://lh3.googleusercontent.com/proxy/ikzC55kjdffQSJr32KmCUO2ylmHjhQxUsO1VHCk0c_NjOGqa1S2oo5Q-EFnPQEUdBd-zgF8kKcL6UG60u5mOKzsyBnSJIfiRWQfcMU6JsXyHG_7QnAjvpVGR71At1p2dNF3H';
          break;
        case 7:
          bgImgUrl = 'https://wallpapercave.com/wp/wp7658018.jpg';
          break;
        case 8:
          bgImgUrl = 'https://i.pinimg.com/originals/96/14/93/9614939a6a1da0be11d1c4bcab47f1c8.jpg';
          break;
        default:
          bgImgUrl = 'https://wallpapercave.com/wp/wp5600150.jpg';
      }
    }
  }

}