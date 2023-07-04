import 'dart:convert';

import 'package:climate_bloc/weather_bloc/weather_event.dart';
import 'package:climate_bloc/weather_bloc/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../weather_repo.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(InitialWeatherState()) {
    on<GetWeather>(_getWeather);
  }

  Future<void> _getWeather(GetWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    WeatherRepository weatherRepository = WeatherRepository();
    final weatherResponse =
        await weatherRepository.getWeather(city: event.cityName);
    if (weatherResponse.statusCode == 200) {
      final weatherResponseJson = weatherResponse.body;
      final decodedJson = jsonDecode(weatherResponseJson);
      final temp = decodedJson['main']['temp'];
      emit(WeatherLoadedState(
          event.cityName, (temp - 273).toString().split('.')[0]));
    } else {
      emit(WeatherErrorState());
    }
  }
}
