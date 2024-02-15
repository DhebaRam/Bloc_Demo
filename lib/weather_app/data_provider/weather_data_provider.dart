import 'package:http/http.dart' as http;
const openWeatherAPIKey = '4af409a4c67493e64a7c44c96d9c51e3';

class WeatherDataProvider{
  Future<String> getCurrentWeather(String cityName) async {
    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );

      return res.body;
    } catch (e) {
      throw e.toString();
    }
  }
}