import 'dart:convert';
import 'dart:developer';

import 'package:bloc_demo/weather_app/data_provider/weather_data_provider.dart';

import '../models/weather_model.dart';

class WeatherRepository{
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather(String currentCity) async {
    try {
      String cityName = currentCity ?? 'New Delhi';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      log('API Response ----->${weatherData}');

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromJson(data);
    } catch (e) {
      throw e.toString();
    }
  }
}