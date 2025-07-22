import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/core/enums/enum.dart';
import 'package:intl/intl.dart';

void main(List<String> arguments) {
  final weatherDatasource = WeatherRemoteDatasource();

  // Prototype usage
  City city = City.washington;

  weatherDatasource
      .getWeather(city)
      .then((weather) {
        print('Hourly weather data for ${city.name}:');
        for (int i = 0; i < 24; i++) {
          String time =
              'Time: ${DateFormat('yyyy-MM-dd – HH:mm').format(weather.time[i])}';
          String temperature = 'Temperature: ${weather.temperature[i]}°C';
          print(
            '$time' +
                ' $temperature' +
                ('=' * weather.temperature[i].toInt()).toString(),
          );
        }
      })
      .catchError((error) {
        print('Error fetching weather data: $error');
      });
}
