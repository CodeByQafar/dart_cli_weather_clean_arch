import 'package:weather_app/presentation/extensions/input_validation_extension.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/core/enums/enum.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class WeatherCli {
  final GetWeather getWeather;

  WeatherCli(this.getWeather);

  Future<void> run() async {
    dynamic cityName = await getCityInput();
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

  Future<dynamic> getCityInput() async {
    stdout.write('\nAvailable cities write number or name of city:\n');
    City.values.asMap().forEach((index, city) {
      stdout.write('${index + 1}.${city.name}\n');
    });

    String input = stdin.readLineSync() ?? '';
    if (inputCheck(input) is City)
      return inputCheck(input);
    else if (input == 'exit') {
      print('\nExiting the application.');
      exit(0);
    } else {
      print('\nInvalid input. Please try again.');
    }
    return getCityInput();
  }

  dynamic inputCheck(input) {
    if (input.isNotEmpty) {
      if (isNumeric(input)) {
        input = int.parse(input);
        if (input > 0 && input <= City.values.length)
          return City.values[input - 1];
        else
          return null;
      } else if (isAlphabetic(input)) {
        input = input.toLowerCase();
        dynamic city = City.values
            .where((name) => name.name == input)
            .firstOrNull;
        return city;
      }
    }
  }
}
