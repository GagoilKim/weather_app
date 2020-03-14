import 'package:flutter/material.dart';
import 'WeatherData.dart';
import 'Weather.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


class HomePage  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool isLoading = false;
  WeatherData weatherData;
  Location _location = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    loadWeather();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Forcase',
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: weatherData != null ? Weather(
                          weatherData: weatherData) : Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isLoading ? CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: new AlwaysStoppedAnimation(Colors.white),
                      ) : IconButton(
                        icon: new Icon(Icons.refresh),
                        tooltip: 'Refresh',
                        onPressed: loadWeather,
                      ),
                    )
                  ],

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  loadWeather() async {
    setState(() {
      isLoading = true;
    });

    Map<String, double> location;
    try {
      location = (await _location.getLocation()) as Map<String, double>;
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'PERMISSION_DENIED';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
        'Permission denied - please ask the user to enable it from the app settings';
      }

      location = null;
    }
    if (location != null) {
      final lat = location['latitude'];
      final lon = location['longitude'];

      final weatherResponse = await http.get(
          'https://api.openweathermap.org/data/2.5/weather?APPID=0f386f0a0db9bc9e1b0c012cbe51f386&lat=${lat
              .toString()}&lon=${lon.toString()}');
      if (weatherResponse.statusCode == 200) {
        return setState(() {
          weatherData =
          new WeatherData.fromJson(jsonDecode(weatherResponse.body));
          isLoading = false;
        });
      }
      setState(() {
        isLoading = false;
      });
    }
  }
}
