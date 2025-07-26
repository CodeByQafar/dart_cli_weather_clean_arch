import 'package:weather_app/core/errors/exceptions/exception.dart';
import 'package:weather_app/presentation/extensions/weather_cli_extension.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/core/enums/enum.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class WeatherCli {
  final GetWeather getWeather;

  WeatherCli(this.getWeather);

  Future<void> run() async {
    City cityName = await getCityInput();
    final weatherData = await getWeather.call(cityName);

    showWeatherData(weatherData);
  }

  void showWeatherData(WeatherModel weatherData) {
    print('Hourly weather data for ${weatherData.city.name}:');
    for (int i = 0; i < 24; i++) {
      String time =
          'Time: ${DateFormat('yyyy-MM-dd - HH:mm').format(weatherData.time[i])}';
      String temperature = 'Temperature: ${weatherData.temperature[i]}°C';
      print('$time $temperature${'=' * weatherData.temperature[i].toInt()}');
    }
  }

  Future<City> getCityInput() async {
    stdout.write('\nAvailable cities write number or name of city:\n');
    City.values.asMap().forEach((index, city) {
      stdout.write('${index + 1}.${city.name}\n');
    });

    dynamic input = stdin.readLineSync() ?? '';
    return inputChechk(input)!;
  }

  City? inputChechk(input) {
    if (input.isNotEmpty) {
      if (isNumeric(input)) {
        input = int.parse(input);
        if (input > 0 && input <= City.values.length) {
          return City.values[input - 1];
        }
      } else if (isAlphabetic(input)) {
        return City.values
            .where((name) => name.name.toLowerCase() == input.toLowerCase())
            .first;
      } else {
        throw InputException(
          'Invalid input. Please enter a valid city name or number.',
        );
      }
    } else {
      throw InputException(
        'Invalid input. Please enter a valid city name or number.',
      );
    }
  }
}
