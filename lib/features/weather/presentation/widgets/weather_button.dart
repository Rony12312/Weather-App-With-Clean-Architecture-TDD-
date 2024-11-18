import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/features/weather/presentation/bloc/fetch_weather_bloc.dart';

class WeatherButton extends StatelessWidget {
  final TextEditingController cityController;

  const WeatherButton({Key? key, required this.cityController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (cityController.text.isNotEmpty) {
          context.read<FetchWeatherBloc>().add(FetchWeather(cityName: cityController.text));

        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please enter a city name")),
          );
        }
      },
      child: const Text(
        'Get Weather',
        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
    );
  }
}
