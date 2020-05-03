import 'package:flutter/material.dart';
import 'location_screen.dart';
import '../services/weather.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {

    super.initState();
    getLocation();
  }

  Future getLocation() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getUpdateLocation();
    LocationScreen locationScreen = LocationScreen(weatherData: weatherData);
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => locationScreen));
  }

  final tween = MultiTrackTween([
    Track("size").add(Duration(seconds: 4), Tween(begin: 0.0, end: 150.0)),
    Track("color")
        .add(Duration(seconds: 2),
            ColorTween(begin: Colors.red, end: Colors.blue),
            curve: Curves.easeIn)
        .add(Duration(seconds: 2),
            ColorTween(begin: Colors.blue, end: Colors.green),
            curve: Curves.easeOut),
    Track("rotation").add(Duration(seconds: 1), ConstantTween(0.0)).add(
        Duration(seconds: 3), Tween(begin: 0.0, end: pi / 2),
        curve: Curves.easeOutSine)
  ]);

  Widget buildAnimation() {
    return ControlledAnimation(
      playback: Playback.MIRROR,
      duration: tween.duration,
      tween: tween,
      builder: (context, animation) {
        return Transform.rotate(
          angle: animation["rotation"],
          child: Container(
            width: animation["size"],
            height: animation["size"],
            color: animation["color"],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Center(child: buildAnimation())),
      ),
    );
  }
}
