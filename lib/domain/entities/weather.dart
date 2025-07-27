import 'package:weather_app/core/enums/enum.dart';

class Weather {
  List<double> temperature;
  List<DateTime> time;
  City city;

  Weather({required this.temperature, required this.time, required this.city});
}
