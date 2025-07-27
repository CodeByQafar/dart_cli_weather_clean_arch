import 'package:weather_app/presentation/weather_cli.dart';

extension InputValidationExtension on WeatherCli {
  bool isNumeric(String input) => RegExp(r'^\d+$').hasMatch(input);
  bool isAlphabetic(String input) => RegExp(r'^[a-zA-Z]+$').hasMatch(input);
}
