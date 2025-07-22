import 'package:weather_app/domain/entities/weather.dart';
import 'package:weather_app/core/enums/enum.dart';

class WeatherModel extends Weather {
  WeatherModel({required temperature, required time})
    : super(temperature: temperature, time: time);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    List<DateTime> timeList = List<DateTime>.from(
      json['hourly']['time'].map((time) => DateTime.parse(time)),
    );
    List<double> temperatureList = List<double>.from(
      json['hourly']['temperature_2m'].map((temp) => temp.toDouble()),
    );

    return WeatherModel(temperature: temperatureList, time: timeList);
  }
}
