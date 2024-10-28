import 'package:flutter_totorial/weather_app/models/current.dart';
import 'package:flutter_totorial/weather_app/models/forecast.dart';
import 'package:flutter_totorial/weather_app/models/location.dart';

class WeatherReport {
  WeatherReport({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'location': final Map<String, dynamic> location,
        'current': final Map<String, dynamic> current,
        'forecast': final Map<String, dynamic> forecast,
      } =>
        WeatherReport(
          location: Location.fromJson(location),
          current: Current.fromJson(current),
          forecast: Forecast.fromJson(forecast),
        ),
      _ => throw Exception('Could not deserialize WeatherReport model'),
    };
  }

  final Location location;
  final Current current;
  final Forecast forecast;
}
