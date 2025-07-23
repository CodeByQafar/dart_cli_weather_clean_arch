import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/core/enums/enum.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource datasource;
  WeatherRepositoryImpl(this.datasource);

  @override
  Future<WeatherModel> getWeather(City city) {
    return datasource.getWeather(city);
  }
}
