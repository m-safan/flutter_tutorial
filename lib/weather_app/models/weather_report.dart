import 'package:flutter_totorial/weather_app/models/current.dart';
import 'package:flutter_totorial/weather_app/models/location.dart';

class WeatherReport {
  WeatherReport({required this.location, required this.current});

  final Location location;
  final Current current;

  factory WeatherReport.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'location': Map<String, dynamic> location,
        'current': Map<String, dynamic> current,
      } =>
        WeatherReport(
            location: Location.fromJson(location),
            current: Current.fromJson(current)),
      _ => throw Exception('Could not deserialize WeatherReport model'),
    };
  }
}
