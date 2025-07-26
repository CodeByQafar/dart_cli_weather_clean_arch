import 'package:weather_app/core/errors/exceptions/exception.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/core/enums/enum.dart';
import 'package:weather_app/data/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherRemoteDatasource {
  Future<WeatherModel> getWeather(City city) async {
    final response = await http.get(
      Uri.parse(
        '${Url.baseUrl}?latitude=${city.latitude}&longitude=${city.longitude}&hourly=temperature_2m.json',
      ),
    );
    if (response.statusCode != 200) {
      throw ServerException(
        'Failed to load weather data response code: ${response.statusCode}',
      );
    } else {
      return WeatherModel.fromJson(json.decode(response.body), city);
    }
  }
}
