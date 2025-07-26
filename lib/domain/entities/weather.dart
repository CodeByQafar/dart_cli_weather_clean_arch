import 'package:weather_app/core/enums/enum.dart';

class Weather {
  List<DateTime> time;
  List<double> temperature;
  City city;
  Weather({required this.temperature, required this.time, required this.city});
}
