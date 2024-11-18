import 'package:dartz/dartz.dart';
import 'package:untitled14/core/error/failure.dart';
import 'package:untitled14/features/weather/domain/repositories/weather_repository.dart';
import 'package:untitled14/features/weather/data/models/api_parse.dart'; // Import the Weather model

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Either<Failure, Weather>> call(String cityName) async {
    try {
      // Fetch weather data from the repository
      final result = await repository.getWeather(cityName);
    print(result);
      // Propagate the result as it is (either Left or Right)
      return result;
    } catch (e) {
      // Return a failure in case of an exception
      print('Error in GetWeather use case: ${e.toString()}');
      return Left(ServerFailure('Error fetching weather data: ${e.toString()}'));
    }
  }
}
