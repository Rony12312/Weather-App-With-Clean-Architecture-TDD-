import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled14/core/error/exceptions.dart';
import 'package:untitled14/features/weather/data/models/api_parse.dart';

abstract class WeatherRemoteDataSource {
  /// Fetches weather data for the given city name from the Weather API.
  Future<Weather> getWeather(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<Weather> getWeather(String cityName) async {
    final url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?q=$cityName&key=1b5b72888ff5444fa56180533241611');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print('Weather data: $jsonData');
      return Weather.fromJson(jsonData);
    } else {
      print('Error: ${response.statusCode}');
      print('Error body: ${response.body}');
      throw ServerException('Failed to load weather data');
    }

  }
}
