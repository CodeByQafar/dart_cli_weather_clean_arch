import 'package:intl/intl.dart';
import 'package:weather_app/core/enums/enum.dart';
import 'package:weather_app/data/models/weather_model.dart';

import '../domain/usecases/get_weather.dart';

class WeatherCli {
  final WeatherModel weatherModel;

  WeatherCli(this.weatherModel);

  Future<void> run(City city) async {
    print('Hourly weather data for ${city.name}:');
    for (int i = 0; i < 24; i++) {
      String time =
          'Time: ${DateFormat('yyyy-MM-dd – HH:mm').format(weatherModel.time[i])}';
      String temperature = 'Temperature: ${weatherModel.temperature[i]}°C';
      print(
        '$time' +
            ' $temperature' +
            ('=' * weatherModel.temperature[i].toInt()).toString(),
      );
    }
  }
}
