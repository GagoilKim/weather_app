import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'WeatherData.dart';

class Weather extends StatelessWidget{
  final WeatherData weatherData;
  Weather({Key key, @required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(weatherData.name, style: new TextStyle(fontSize: 40, color: Colors.white),),
        Text(weatherData.main, style: new TextStyle(fontSize: 30, color:  Colors.white),),
        Image.network('https://openweathermap.org/img/w/${weatherData.icon}.png'),
        Text('${weatherData.temp.toString()}°F',  style: new TextStyle(color: Colors.white, fontSize: 30)),
        Text(new DateFormat.yMMMd().format(weatherData.date), style: new TextStyle(fontSize: 20, color: Colors.white),),

      ],
    );
  }

}