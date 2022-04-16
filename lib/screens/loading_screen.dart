import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/location_screen.dart';
import '../services/networking.dart';
import '../screens/location_screen.dart';
import '../services/weather.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async{

      WeatherModelData weatherModelData = WeatherModelData();
      var weatherData = await weatherModelData.getWeatherData();

      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(locationWeather: weatherData,);
      }));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.amberAccent,
          size: 100.0,
        ),

      )
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       getLocationData();
      //       // getWeather();
      //     },
      //     child: const Text('Get Location'),
      //   ),
      // ),
    );
  }
}