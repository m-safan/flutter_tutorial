import 'dart:convert';

import 'package:flutter_totorial/weather_app/models/location.dart';
import 'package:flutter_totorial/weather_app/models/weather_report.dart';
import 'package:http/http.dart';

class WeatherService {
  final _apiKey = '';

  Future<WeatherReport> getWeatherReport(String query) async {
    final response = await get(
      Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?q=$query&days=14&key=$_apiKey',
      ),
    );
    if (response.statusCode != 200) throw Exception(response.statusCode);

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return WeatherReport.fromJson(json);
  }

  Future<List<Location>> getLocations(String query) async {
    final response = await get(
      Uri.parse(
        'https://api.weatherapi.com/v1/search.json?q=$query&key=$_apiKey',
      ),
    );
    if (response.statusCode != 200) throw Exception(response.statusCode);

    final list = jsonDecode(response.body) as List<dynamic>;
    return list
        .map((x) => Location.fromJson(x as Map<String, dynamic>))
        .toList();
  }
}
