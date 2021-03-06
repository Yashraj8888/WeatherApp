import '../services/networking.dart';
import 'package:geolocator/geolocator.dart';


class WeatherModelData {

  double lat=0;
  double long=0;
  String apikey = 'e669f844675422f0ee9bafcbb39668c3';
  Future<dynamic> getWeatherDataByCityName ( String cityName) async {
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${apikey}&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  Future<dynamic> getWeatherData () async{
  LocationPermission permission = await Geolocator.requestPermission();
  // permission = await Geolocator.checkPermission();
  Position position = await Geolocator.getCurrentPosition(
  desiredAccuracy: LocationAccuracy.low);
  // print(position);
  lat = position.latitude;
  long = position.longitude;
  NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apikey&units=metric');
  var weatherData = await networkHelper.getData();

  return weatherData;
}}


class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}