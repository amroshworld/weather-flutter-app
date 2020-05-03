import 'package:flutter/cupertino.dart';
import '../utilities/location.dart';
import '../utilities/networkHelper.dart';

class WeatherModel {

  String apiKey = "214d0b73a1391910944423e3fccdbf58";


  Future<dynamic> getUpdateLocationByCity(String city) async {

    NetworkHelper getData = NetworkHelper(
        u: 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric');

    var weatherData = await getData.url();

    return weatherData ;

  }

  Future<dynamic> getUpdateLocation() async {

    Location location = Location();

    await location.currentLocation();

    NetworkHelper getData = NetworkHelper(
        u: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await getData.url();

    return weatherData ;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'images/cold.png';
    } else if (condition < 400) {
      return 'images/cold.png';
    } else if (condition < 600) {
      return 'images/umbrella.png';
    } else if (condition < 700) {
      return 'images/cold.png';
    } else if (condition < 800) {
      return 'images/water.png';
    } else if (condition == 800) {
      return 'images/sun.png';
    } else if (condition <= 804) {
      return 'images/clouds.png';
    } else {
      return 'images/cold.png‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
