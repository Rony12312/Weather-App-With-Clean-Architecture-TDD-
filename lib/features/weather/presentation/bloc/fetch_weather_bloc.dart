import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/api_parse.dart';
import '../../domain/usecases/get_weather.dart';

part 'fetch_weather_event.dart';
part 'fetch_weather_state.dart';

class FetchWeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeatherUseCase;

  FetchWeatherBloc({required this.getWeatherUseCase}) : super(WeatherInitial()) {
    // Registering the FetchWeather event
    on<FetchWeather>(_onFetchWeather);
  }

  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    // Emit loading state
    emit(WeatherLoading());

    // Fetch weather using the GetWeather use case
    final result = await getWeatherUseCase(event.cityName);

    // Handle the result and emit appropriate states
    result.fold(
          (failure) {
        // Emit error state if failure
        emit(WeatherError(message: 'Failed to fetch weather: ${failure.message}'));
      },
          (weather) {
        // Emit success state with weather data
        emit(WeatherLoaded(weather: weather));
      },
    );
  }
}
