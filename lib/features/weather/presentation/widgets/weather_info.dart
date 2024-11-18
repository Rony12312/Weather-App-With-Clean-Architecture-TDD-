import 'package:flutter/material.dart';
import 'package:untitled14/features/weather/presentation/widgets/sun_info.dart';
import '../../data/models/api_parse.dart';

class WeatherInfo extends StatelessWidget {
  final Weather weatherData;

  const WeatherInfo({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "${weatherData.cityName}, ${weatherData.country}",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(height: 8),
        // Weather logo
        Center(child: Image.asset("images/Logo.jpg", height: 100)),

        // Weather condition
        Center(
          child: Text(
            "${weatherData.condition}",
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),

        // Current time and day of the week
        const SizedBox(height: 8),
        Center(
          child: Text(
            "${weatherData.dayOfWeek} ${weatherData.currentTime}",
            style: const TextStyle(color: Colors.white, fontSize: 55),
          ),
        ),
        const SizedBox(height: 30),

        // Temperature details handled by TemperatureInfoWidget
        TemperatureInfoWidget(weatherData: weatherData),

        // Divider between sections
        const Padding(padding: EdgeInsets.symmetric(vertical: 5), child: Divider(color: Colors.grey)),


      ],
    );
  }
}
