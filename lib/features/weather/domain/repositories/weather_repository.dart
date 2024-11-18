import 'package:dartz/dartz.dart';
import 'package:untitled14/features/weather/data/models/api_parse.dart';  // Import the Weather model

import '../../../../core/error/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeather(String cityName);
}
