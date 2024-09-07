import 'package:flutter_totorial/weather_app/models/current.dart';
import 'package:flutter_totorial/weather_app/models/forecast.dart';
import 'package:flutter_totorial/weather_app/models/location.dart';

class WeatherReport {
  WeatherReport({
    required this.location,
    required this.current,
    required this.forecast,
  });

  final Location location;
  final Current current;
  final Forecast forecast;

  factory WeatherReport.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'location': Map<String, dynamic> location,
        'current': Map<String, dynamic> current,
        'forecast': Map<String, dynamic> forecast,
      } =>
        WeatherReport(
          location: Location.fromJson(location),
          current: Current.fromJson(current),
          forecast: Forecast.fromJson(forecast),
        ),
      _ => throw Exception('Could not deserialize WeatherReport model'),
    };
  }
}
