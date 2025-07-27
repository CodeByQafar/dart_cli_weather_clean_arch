import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/core/enums/enum.dart';

class WeatherModel extends Weather {
  List<DateTime> time;
  List<double> temperature;
  City city;

  WeatherModel({
    required this.temperature,
    required this.time,
    required this.city,
  }) : super(temperature: temperature, time: time, city: city);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<DateTime> timeList = List<DateTime>.from(
      json['hourly']['time'].map((time) => DateTime.parse(time)),
    );
    List<double> temperatureList = List<double>.from(
      json['hourly']['temperature_2m'].map((temp) => temp.toDouble()),
    );
    City cityName = json['city'];
    return WeatherModel(
      temperature: temperatureList,
      time: timeList,
      city: cityName,
    );
  }
}
