import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/core/enums/enum.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getWeather(City city);
}
