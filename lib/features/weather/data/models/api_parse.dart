import 'package:intl/intl.dart';

class Weather {
  final String cityName;
  final String condition;
  final double temperature;
  final double maxTemperature;
  final double minTemperature;
  final String currentTime;
  final String sunriseTime;
  final String sunsetTime;
  final String country;
  final String localtime;

  Weather({
    required this.cityName,
    required this.condition,
    required this.temperature,
    required this.maxTemperature,
    required this.minTemperature,
    required this.currentTime,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.country,
    required this.localtime,
  });

  // fromJson method to convert JSON into Weather object
  factory Weather.fromJson(Map<String, dynamic> json) {
    String localTime = json['location']['localtime']; // "YYYY-MM-DD HH:MM"
    DateTime.parse(localTime);

    return Weather(
      cityName: json['location']['name'],
      condition: json['current']['condition']['text'],
      temperature: json['current']['temp_c'].toDouble(),
      maxTemperature: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toDouble(),
      minTemperature: json['forecast']['forecastday'][0]['day']['mintemp_c'].toDouble(),
      currentTime: localTime,
      sunriseTime: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunsetTime: json['forecast']['forecastday'][0]['astro']['sunset'],
      country: json['location']['country'],
      localtime: json['location']['localtime'],
    );
  }

  // Method to extract the day of the week from currentTime
  String get dayOfWeek {
    DateTime currentDateTime = DateTime.parse(currentTime);
    return DateFormat('EEEE').format(currentDateTime); // Day of the week (e.g., "Monday")
  }

  // Added toString method for human-readable output
  @override
  String toString() {
    return '$cityName, $country: $condition\nTemperature: ${temperature.toStringAsFixed(1)}°C\n'
        'Max Temp: ${maxTemperature.toStringAsFixed(1)}°C | Min Temp: ${minTemperature.toStringAsFixed(1)}°C\n'
        'Sunrise: $sunriseTime | Sunset: $sunsetTime\nTime: $currentTime';
  }
}
