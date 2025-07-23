import 'package:weather_app/core/enums/enum.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository weatherRepository;
  GetWeather(this.weatherRepository);

  Future<WeatherModel> call(City city) {
    return weatherRepository.getWeather(city);
  }
}
