import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:untitled14/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:untitled14/features/weather/data/sources/weather_remote_data_source.dart';
import 'package:untitled14/features/weather/domain/repositories/weather_repository.dart';
import 'package:untitled14/features/weather/domain/usecases/get_weather.dart';
import 'package:untitled14/features/weather/presentation/bloc/fetch_weather_bloc.dart';

final GetIt ls = GetIt.instance;

void setupServiceLocator() {
  // Register external dependencies
  ls.registerLazySingleton(() => http.Client());

  // Register data sources
  ls.registerLazySingleton<WeatherRemoteDataSource>(
          () => WeatherRemoteDataSourceImpl(client: ls()));

  // Register repositories
  ls.registerLazySingleton<WeatherRepository>(
          () => WeatherRepositoryImpl(remoteDataSource: ls()));

  // Register use cases
  ls.registerLazySingleton(() => GetWeather(ls())); // Make sure this line is only here

  // Register BLoC
  ls.registerFactory(() => FetchWeatherBloc(getWeatherUseCase: ls()));
}
