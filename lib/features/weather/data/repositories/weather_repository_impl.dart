import 'package:dartz/dartz.dart';
import 'package:untitled14/core/error/exceptions.dart';
import 'package:untitled14/core/error/failure.dart';

import 'package:untitled14/features/weather/data/models/api_parse.dart';
import 'package:untitled14/features/weather/domain/repositories/weather_repository.dart';

import '../sources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getWeather(String cityName) async {
    try {
      // Call the remote data source to fetch weather data
      final weather = await remoteDataSource.getWeather(cityName);
      return Right(weather);
    } on ServerException catch (e) {
      // Return a Failure if a ServerException occurs
      return Left(ServerFailure(e.message));
    } catch (e) {
      // Handle other unforeseen exceptions
      print('Unexpected error: ${e.toString()}');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
