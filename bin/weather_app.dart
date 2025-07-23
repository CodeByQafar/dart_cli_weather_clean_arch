import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/presentation/weather_cli.dart';
import 'package:weather_app/core/enums/enum.dart';

Future<void> main(List<String> arguments) async {
  City city = City.washington;

  final datasource = WeatherRemoteDatasource();
  final repository = WeatherRepositoryImpl(datasource);
  final getWeather = GetWeather(repository);
  final weatherCli = WeatherCli(await getWeather.call(city));

  weatherCli.run(city);
}
