class WeatherState {
  final String cityName;
  final String temperature;

  WeatherState(this.cityName, this.temperature);

}

class InitialWeatherState extends WeatherState {
  InitialWeatherState() : super('', '0.0');
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState() : super('', '0.0');
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(String cityName, String temperature) : super(cityName, temperature);
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState() : super('', '0.0');
}
