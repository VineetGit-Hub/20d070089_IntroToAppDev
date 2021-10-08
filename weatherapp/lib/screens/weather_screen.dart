import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherapp/services/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather data = Weather(city: '');

  @override
  Widget build(BuildContext context) {
    data = data.city == '' ? (ModalRoute.of(context)!.settings.arguments as Map)['object'] : data;

    return Scaffold(
      body: Container(
        //constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          /*gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFFE3D26F),
              Color(0xFFCA895F),
              Color(0xFFA15E49),
              Color(0xFFEC414E),
            ],
          ),*/
          image: DecorationImage(
            image: NetworkImage('${data.bgImgUrl}'),
          fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ElevatedButton(
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.edit_location_outlined,
                        ),
                        SizedBox(width: 10.0,),
                        const Text('Search City', textScaleFactor: 1.5,),
                      ],
                    ),
                  ),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/search');
                    setState(() {
                      data = result['object'];
                    });
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Color(0xDDA1A499),
                        Color(0xDD274C77),
                        Color(0xEE3E3939),
                        Color(0x88202020),
                      ],
                    ),
                  ),
                  height: 250,
                  width: 600,
                  //color: Color(0xFF363636),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -30,
                        left: -20,
                        child: Image(
                          image: NetworkImage('http://openweathermap.org/img/wn/${data.icon}@2x.png', scale: 0.4),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 40,
                        child: Text('${data.city}', style: TextStyle(fontSize: 30, color: Colors.orangeAccent, fontWeight: FontWeight.w500,),),
                      ),
                      Positioned(
                        left: 200,
                        top: 70,
                        child: Text('${data.type}', style: TextStyle(color: Color(0xFFE82039), fontSize: 50),)
                      ),
                      Positioned(
                        left: 180,
                        top: 150,
                        child: Text('${data.description}', style: TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 400,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 10,
                        height: 150,
                        left: 0,
                        right: 0,
                        child: Card(
                          elevation: 30,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Color(0xBB000000),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.thermostat_rounded, color: Color(0xFFFF1F40), size: 50,),
                                    SizedBox(height: 10,),
                                    Text('${(data.main!['temp'] - 273.15).toStringAsFixed(2)} °C', style: TextStyle(color: Color(
                                        0xFFFF1F40), fontWeight: FontWeight.w600, fontSize: 30,),),
                                  ],
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Pressure: ${data.main!['pressure']} hPa', style: TextStyle(color: Color(
                                        0xFFFFFFFF), fontWeight: FontWeight.w600, fontSize: 20,),),
                                    SizedBox(height: 20,),
                                    Text('Humidity: ${data.main!['humidity']} %', style: TextStyle(color: Color(
                                        0xFFFFFFFF), fontWeight: FontWeight.w600, fontSize: 20,),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 190,
                        width: 180,
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(0xBB333333),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Text('Wind', style: TextStyle(color: Color(
                                      0xFF00FF84), fontWeight: FontWeight.w600, fontSize: 23,),),
                                ),
                                SizedBox(height: 10,),
                                Text('Speed:\n ${data.wind!['speed']} m/s', style: TextStyle(color: Color(
                                    0xFFFFFFFF), fontWeight: FontWeight.w600, fontSize: 20,),),
                                SizedBox(height: 10,),
                                Text('Angle:\n ${data.wind!['deg']} °', style: TextStyle(color: Color(
                                    0xFFFFFFFF), fontWeight: FontWeight.w600, fontSize: 20,),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 170,
                        right: 0,
                        width: 180,
                        child: Card(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Color(0xBB333333),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.visibility_outlined, size: 40, color: Colors.brown,),
                                Text('Visibility:\n   ${(data.visibility! / 1000).toStringAsFixed(3)} km', style: TextStyle(color:
                                Color(0xFFFFFFFF), fontWeight: FontWeight.w600, fontSize: 20,),),
                                SizedBox(height: 10,),
                                Icon(Icons.wb_cloudy, size: 40, color: Color(0xFF3D68DB),),
                                Text('Clouds:\n   ${data.cloudy} %', style: TextStyle(color: Color(
                                    0xFFFFFFFF), fontWeight: FontWeight.w600, fontSize: 20,),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
