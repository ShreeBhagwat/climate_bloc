import 'dart:developer';

import 'package:climate_bloc/weather_bloc/weather_bloc.dart';
import 'package:climate_bloc/weather_bloc/weather_event.dart';
import 'package:climate_bloc/weather_bloc/weather_state.dart';
import 'package:climate_bloc/weather_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
   WeatherScreen({super.key});

TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.cityName),
                Text(state.temperature.toString()),
              ],
            ),
          );
        } else if (state is InitialWeatherState) {
          return Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text("Enter City Name"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'Pune',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context)
                          .add(GetWeather(_controller.text));
                    },
                    child: const Text('Get Weather'))
              ],
            ),
          );
        } else if (state is WeatherLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherErrorState) {
          return const Center(
            child: Text("Error"),
          );
        }
        return Container();
      }),
    );
  }
}
