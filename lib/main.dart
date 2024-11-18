import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di.dart'; // Import the DI file
import 'features/weather/presentation/bloc/fetch_weather_bloc.dart';
import 'features/weather/presentation/pages/home_page.dart';

void main() {
  setupServiceLocator(); // Initialize the service locator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ls<FetchWeatherBloc>(), // Use the locator to provide the BLoC
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
