import 'package:flutter/material.dart';
import '../../data/models/api_parse.dart'; // Corrected import with relative path

class TemperatureInfoWidget extends StatelessWidget {
  final Weather weatherData;

  const TemperatureInfoWidget({Key? key, required this.weatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Temperature Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTemperatureItem("Min Temp", "${weatherData.minTemperature}°C"),
            _buildTemperatureItem("Current Temp", "${weatherData.temperature}°C"),
            _buildTemperatureItem("Max Temp", "${weatherData.maxTemperature}°C"),
          ],
        ),
        const SizedBox(height: 20), // Space between rows

        // Time and Sun info Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTemperatureItem("Sunrise", "${weatherData.sunriseTime}"),
            _buildTemperatureItem("Sunset", "${weatherData.sunsetTime}"),
          ],
        ),
      ],
    );
  }

  Widget _buildTemperatureItem(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
