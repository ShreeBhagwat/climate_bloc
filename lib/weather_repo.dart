import 'package:http/http.dart' as http;

const String apiKey = "c6ffee661d487dae28b7f3244285f579";

class WeatherRepository {
  Future<http.Response> getWeather({required String city}) async {
    return await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));
  }
}
