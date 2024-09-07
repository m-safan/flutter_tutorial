import 'package:flutter_totorial/weather_app/models/location.dart';
import 'package:flutter_totorial/weather_app/models/weather_report.dart';
import 'package:flutter_totorial/weather_app/services/weather_service.dart';

class WeatherAppController {
  final _service = WeatherService();

  Future<WeatherReport> getWeatherReport(String query) async {
    final weatherReport = await _service.getWeatherReport(query);
    return weatherReport;
  }

  Future<List<Location>> getLocations(String query) async {
    final locations = await _service.getLocations(query);
    return locations;
  }
}
