import 'package:climate_bloc/weather_bloc/weather_bloc.dart';
import 'package:climate_bloc/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(WeatherBlocAPP());
}

class WeatherBlocAPP extends StatelessWidget {
  const WeatherBlocAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:
            BlocProvider(create: (_) => WeatherBloc(), child: WeatherScreen()));
  }
}
