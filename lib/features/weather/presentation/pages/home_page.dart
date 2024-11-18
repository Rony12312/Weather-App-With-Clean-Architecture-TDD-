import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled14/features/weather/presentation/bloc/fetch_weather_bloc.dart';
import 'package:untitled14/features/weather/presentation/widgets/weather_button.dart';
import 'package:untitled14/features/weather/presentation/widgets/weather_info.dart';  // Import WeatherInfo
// Import SunInfoWidget

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  hintText: "Enter City Name",
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              WeatherButton(cityController: cityController),
              const SizedBox(height: 40),
              BlocBuilder<FetchWeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is WeatherLoaded) {
                    // Get the weather data
                    final weather = state.weather;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display the weather info
                        WeatherInfo(weatherData: weather),

                        const SizedBox(height: 30),

                      ],
                    );
                  } else if (state is WeatherError) {
                    return Text(
                      'Error: ${state.message}',
                      style: const TextStyle(color: Colors.red, fontSize: 18),
                    );
                  } else {
                    return const Text(
                      'No data available',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
